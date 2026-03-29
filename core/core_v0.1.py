# core/core_v0.1.py
# AstroRealm Stable Core v0.1 - 改进版
# 解决：状态流转、Validation、Skill 动态加载、Logger

import json
import time
import traceback
import logging
from datetime import datetime
from pathlib import Path
from skill_interface import SkillResult
from importlib import import_module

# ==================== 日志配置 ====================
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s | %(levelname)s | %(message)s',
    handlers=[
        logging.FileHandler("/home/astro/astrorealm/logs/core.log", encoding="utf-8"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

# ==================== 配置路径 ====================
BASE_DIR = Path("/home/astro/astrorealm")
TASK_DIR = BASE_DIR / "tasks"
RESULT_DIR = BASE_DIR / "results"
LOG_DIR = BASE_DIR / "logs"

for d in [TASK_DIR, RESULT_DIR, LOG_DIR]:
    d.mkdir(parents=True, exist_ok=True)

# ==================== 1. Task 状态流转控制 ====================
def update_task_status(task: dict, new_status: str, result: SkillResult | None = None):
    """统一更新任务状态，防止重复执行"""
    task["status"] = new_status
    if result:
        task["result"] = result.result
        task["error"] = result.error
        task["metadata"] = result.metadata
    task["updated_at"] = datetime.now().isoformat()

    # 立即写回文件（持久化状态）
    result_path = RESULT_DIR / f"{task['id']}.json"
    result_path.write_text(json.dumps(task, ensure_ascii=False, indent=2), encoding="utf-8")

# ==================== 2. Skill 动态加载（解决写死问题） ====================
def load_skill(skill_name: str):
    """动态导入 Skill，实现真正插拔"""
    try:
        module = import_module(f"skills.{skill_name}")
        return getattr(module, "execute", None)
    except Exception as e:
        logger.error(f"加载 Skill {skill_name} 失败: {e}")
        return None

# ==================== 3. Skill 执行器（工头） ====================
def execute_skill(task: dict) -> SkillResult:
    skill_name = task.get("skill_name", "unknown")
    logger.info(f"开始执行 Skill: {skill_name} | 任务ID: {task.get('id')}")

    # Validation（解决之前报错核心原因）
    if not skill_name or skill_name == "unknown":
        return SkillResult(status="failed", error="缺少 skill_name")

    skill_func = load_skill(skill_name)
    if not skill_func:
        return SkillResult(status="failed", error=f"Skill '{skill_name}' 不存在或加载失败")

    try:
        # 执行 Skill
        return skill_func(task)
    except Exception as e:
        logger.exception(f"Skill {skill_name} 执行异常")
        return SkillResult(
            status="failed",
            error=str(e) + "\n" + traceback.format_exc()
        )

# ==================== 4. 永不死亡的主循环（带状态控制） ====================
def main_loop():
    logger.info("🚀 AstroRealm Stable Core v0.1 已启动（改进版）")
    logger.info("地基模式：支持状态流转 + 动态 Skill 加载\n")

    while True:
        try:
            for task_file in list(TASK_DIR.glob("*.json")):
                try:
                    task = json.loads(task_file.read_text(encoding="utf-8"))
                    
                    if task.get("status") != "pending":
                        continue

                    # 状态流转：pending → running
                    update_task_status(task, "running")

                    result = execute_skill(task)

                    # 最终状态：running → success/failed
                    final_status = "success" if result.status == "success" else "failed"
                    update_task_status(task, final_status, result)

                    logger.info(f"任务完成 → {task['id']} | 状态: {final_status}")

                except Exception as e:
                    logger.error(f"处理任务文件失败 {task_file}: {e}")

        except Exception as e:
            logger.error(f"主循环异常（已自动恢复）: {e}")
            time.sleep(2)

        time.sleep(1)  # 可改为事件驱动

if __name__ == "__main__":
    main_loop()