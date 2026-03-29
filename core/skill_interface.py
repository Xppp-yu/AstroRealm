# core/skill_interface.py
# AstroRealm Skill 标准接口定义
# 所有 Skill 都必须遵守这个格式，这样 Core 才能统一调用和处理结果

from typing import Dict, Any
from dataclasses import dataclass

@dataclass
class SkillResult:
    """所有 Skill 返回的统一结果格式"""
    status: str          # "success" | "failed"
    result: Any          # 执行结果（可以是字符串、字典、文件路径等）
    error: str | None = None
    metadata: Dict = None   # 可放耗时、token 用量、专业元数据等

    def __post_init__(self):
        if self.metadata is None:
            self.metadata = {}

# 示例使用（以后写 Skill 时直接返回 SkillResult）
# return SkillResult(status="success", result="CSS 文件已创建", metadata={"file_path": "..."})