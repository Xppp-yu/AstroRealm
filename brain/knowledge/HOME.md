# 🏠 CoBrain Home

---

## 🎯 今日聚焦

```dataviewjs
const today = new Date();
const y = today.getFullYear();
const m = String(today.getMonth() + 1).padStart(2, '0');
const d = String(today.getDate()).padStart(2, '0');
const dateStr = `${y}-${m}-${d}`;

const todayFile = dv.pages('"01-Daily"').where(p => p.file.name === dateStr);

let html = '<div class="home-section"><div class="today-focus">';
html += '<span class="today-date">📅 ' + dateStr + '</span>';

if (todayFile.length > 0) {
  html += '<a class="today-link" href="obsidian://open?vault=CoBrain&file=01-Daily%2F' + dateStr + '">查看今日日志 →</a>';
} else {
  html += '<a class="today-link" href="obsidian://open?vault=CoBrain&file=01-Daily%2F' + dateStr + '">创建今日日志 →</a>';
}

html += '</div></div>';
dv.paragraph(html);
```

---

## 📊 知识统计

```dataviewjs
const concepts = dv.pages('"03-Concepts"').length;
const wikis = dv.pages('"07-Wiki"').length;
const categories = dv.pages('"08-Categories"').length;
const dailies = dv.pages('"01-Daily"').length;
const projects = dv.pages('"02-Projects"').length;
const total = concepts + wikis + categories + dailies + projects;

const stats = [
  { icon: '📝', label: '原子笔记', value: concepts },
  { icon: '📚', label: '沉淀知识', value: wikis },
  { icon: '🏷️', label: '分类', value: categories },
  { icon: '📅', label: '日志', value: dailies },
  { icon: '📁', label: '项目', value: projects }
];

let html = '<div class="stats-grid">';
for (const s of stats) {
  html += '<div class="stat-card"><div class="stat-icon">' + s.icon + '</div><div class="stat-value">' + s.value + '</div><div class="stat-label">' + s.label + '</div></div>';
}
html += '<div class="stat-card stat-total"><div class="stat-icon">📈</div><div class="stat-value">' + total + '</div><div class="stat-label">总计</div></div></div>';

dv.paragraph(html);
```

---

## 📅 年度贡献图

```dataviewjs
// GitHub 风格年度贡献图
const today = new Date();
const year = today.getFullYear();

// 获取所有日志文件
const dailyFiles = {};
const files = dv.pages('"01-Daily"');
for (const f of files) {
  const name = f.file.name;
  if (name && /^\d{4}-\d{2}-\d{2}$/.test(name)) {
    dailyFiles[name] = f.file.size || 500;
  }
}

const sizes = Object.values(dailyFiles);
const maxSize = Math.max(...sizes, 500);
const totalCount = sizes.length;

// 月份名称
const monthNames = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];

// 格式化日期
function formatDate(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return y + '-' + m + '-' + d;
}

// 计算日期范围
const startDate = new Date(year, 0, 1);
const endDate = today;

// 生成月份标签
let monthRow = '<div class="contrib-months">';
monthRow += '<span class="contrib-day-label"></span>';
for (let m = 0; m < 12; m++) {
  monthRow += '<span class="contrib-month-label">' + monthNames[m] + '</span>';
}
monthRow += '</div>';

// 生成主体格子
let gridHtml = '<div class="contrib-grid">';

// 星期标签
const dayLabels = ['日', '', '一', '', '三', '', '五'];
for (let i = 0; i < 7; i++) {
  gridHtml += '<span class="contrib-day-label">' + dayLabels[i] + '</span>';
}

// 找到开始周的周日
const startSunday = new Date(startDate);
startSunday.setDate(startSunday.getDate() - startSunday.getDay());

// 生成格子
for (let week = 0; week < 53; week++) {
  for (let day = 0; day < 7; day++) {
    const currentDate = new Date(startSunday);
    currentDate.setDate(currentDate.getDate() + week * 7 + day);

    if (currentDate < startDate || currentDate > endDate) {
      gridHtml += '<span class="contrib-cell contrib-empty"></span>';
      continue;
    }

    const dateStr = formatDate(currentDate);
    const size = dailyFiles[dateStr];
    const level = size ? Math.min(4, Math.ceil((size / maxSize) * 4)) : 0;

    if (size) {
      gridHtml += '<a href="obsidian://open?vault=CoBrain&file=01-Daily%2F' + dateStr + '" class="contrib-cell contrib-level-' + level + '" title="' + dateStr + '"></a>';
    } else {
      gridHtml += '<span class="contrib-cell contrib-level-0" title="' + dateStr + '"></span>';
    }
  }
}

gridHtml += '</div>';

// 图例
let legend = '<div class="contrib-legend"><span>少</span>';
for (let i = 0; i <= 4; i++) {
  legend += '<span class="contrib-cell contrib-level-' + i + '"></span>';
}
legend += '<span>多</span></div>';

// 组合输出
let html = '<div class="contribution-wrapper">';
html += '<div class="contrib-header"><span class="contrib-title">📅 ' + year + ' 年贡献</span><span class="contrib-count">' + totalCount + ' 次记录</span></div>';
html += monthRow;
html += gridHtml;
html += legend;
html += '</div>';

dv.paragraph(html);
```

---

## 🔍 快速导航

```dataviewjs
const navs = [
  { icon: '🗺️', name: 'MOC', desc: '知识图谱入口' },
  { icon: '📅', name: '01-Daily', desc: '每日日志' },
  { icon: '📝', name: '03-Concepts', desc: '原子笔记' },
  { icon: '📚', name: '07-Wiki', desc: '沉淀知识' },
  { icon: '🏷️', name: '08-Categories', desc: '分类浏览' }
];

let html = '<div class="nav-grid">';
for (const n of navs) {
  html += '<a class="nav-card" href="obsidian://open?vault=CoBrain&file=' + encodeURIComponent(n.name) + '"><span class="nav-icon">' + n.icon + '</span><span class="nav-name">' + n.name + '</span><span class="nav-desc">' + n.desc + '</span></a>';
}
html += '</div>';

dv.paragraph(html);
```

---

## 🏷️ 分类浏览

```dataviewjs
const cats = dv.pages('"08-Categories"');
let html = '<div class="category-grid">';
for (const c of cats) {
  const name = c.file.name.replace('分类-', '');
  html += '<a class="category-tag" href="obsidian://open?vault=CoBrain&file=08-Categories%2F' + encodeURIComponent(c.file.name) + '">' + name + '</a>';
}
html += '</div>';
dv.paragraph(html);
```

---

## 🔥 热门词条

```dataviewjs
const hotConcepts = [
  { name: 'Claude-Code', tags: '#AI #开发工具' },
  { name: 'Git', tags: '#版本控制 #开发工具' },
  { name: 'lark-cli', tags: '#飞书 #AI代理' },
  { name: 'Hooks', tags: '#Claude-Code #自动化' },
  { name: 'Skills', tags: '#Claude-Code #扩展系统' },
  { name: 'Obsidian', tags: '#工具 #知识管理' }
];

let html = '<div class="hot-grid">';
for (const h of hotConcepts) {
  html += '<a class="hot-card" href="obsidian://open?vault=CoBrain&file=03-Concepts%2F' + encodeURIComponent(h.name) + '"><span class="hot-name">' + h.name + '</span><span class="hot-tags">' + h.tags + '</span></a>';
}
html += '</div>';

dv.paragraph(html);
```

---

## 📥 待整理 · ❓ 待解答 · 🚀 活跃项目

```dataviewjs
const inbox = dv.pages('"00-Inbox"').length;
const questions = dv.pages('"04-Questions"').length;
const activeProjects = dv.pages('"02-Projects"').where(p => p.status === 'active');

let html = '<div class="status-grid">';

// 待整理
html += '<div class="status-card"><div class="status-header"><span class="status-icon">📥</span><span class="status-title">待整理</span><span class="status-count">' + inbox + '</span></div><div class="status-content">';
if (inbox > 0) {
  html += '<a class="status-link" href="obsidian://open?vault=CoBrain&file=00-Inbox">查看 Inbox →</a>';
} else {
  html += '<span class="status-empty">暂无待整理内容</span>';
}
html += '</div></div>';

// 待解答
html += '<div class="status-card"><div class="status-header"><span class="status-icon">❓</span><span class="status-title">待解答</span><span class="status-count">' + questions + '</span></div><div class="status-content">';
if (questions > 0) {
  html += '<a class="status-link" href="obsidian://open?vault=CoBrain&file=04-Questions">查看问题 →</a>';
} else {
  html += '<span class="status-empty">暂无待解答问题</span>';
}
html += '</div></div>';

// 活跃项目
html += '<div class="status-card"><div class="status-header"><span class="status-icon">🚀</span><span class="status-title">活跃项目</span><span class="status-count">' + activeProjects.length + '</span></div><div class="status-content">';
if (activeProjects.length > 0) {
  for (const p of activeProjects) {
    html += '<span class="project-item">' + p.file.name + '</span>';
  }
} else {
  html += '<span class="status-empty">暂无活跃项目</span>';
}
html += '</div></div>';

html += '</div>';

dv.paragraph(html);
```

---

## 🎲 随机发现

```dataviewjs
const concepts = dv.pages('"03-Concepts"');
if (concepts.length > 0) {
  const random = concepts[Math.floor(Math.random() * concepts.length)];
  const html = '<div class="random-card"><span class="random-icon">🎲</span><span class="random-label">随机推荐</span><a class="random-link" href="obsidian://open?vault=CoBrain&file=03-Concepts%2F' + encodeURIComponent(random.file.name) + '">' + random.file.name + '</a></div>';
  dv.paragraph(html);
}
```

---

## 📅 最近日志

```dataviewjs
const dailies = dv.pages('"01-Daily"').sort(p => p.file.name, 'desc').limit(7);

let html = '<div class="recent-logs">';
for (const d of dailies) {
  const date = d.file.name;
  html += '<a class="log-item" href="obsidian://open?vault=CoBrain&file=01-Daily%2F' + encodeURIComponent(date) + '">' + date + '</a>';
}
html += '</div>';

dv.paragraph(html);
```

---

<div class="home-footer">

*最后更新：2026-04-12* · [[MOC|知识图谱]] · [[HOME|回到首页]]

</div>
