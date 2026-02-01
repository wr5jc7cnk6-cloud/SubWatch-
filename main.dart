<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>SubWatch Pro</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
  margin: 0;
  background: black;
  color: white;
  font-family: -apple-system, BlinkMacSystemFont, sans-serif;
}

header {
  text-align: center;
  padding: 20px;
  font-size: 22px;
  font-weight: bold;
  border-bottom: 1px solid #222;
}

.container {
  padding: 20px;
}

.card {
  background: #111;
  border-radius: 12px;
  padding: 15px;
  margin-bottom: 15px;
}

.button {
  width: 100%;
  padding: 15px;
  background: #00c853;
  border: none;
  border-radius: 12px;
  color: white;
  font-size: 16px;
  margin-top: 10px;
}

.status {
  font-size: 14px;
  color: #aaa;
  margin-top: 5px;
}
</style>
</head>

<body>

<header>SubWatch Pro</header>

<div class="container">

<div class="card">
  <h3>監視状態</h3>
  <div id="statusText">停止中</div>
  <div class="status">リアルタイムステータス</div>
  <button class="button" onclick="toggleWatch()">開始 / 停止</button>
</div>

<div class="card">
  <h3>ログ</h3>
  <div id="log">待機中...</div>
</div>

</div>

<script>
let running = false;

function toggleWatch() {
  running = !running;

  if (running) {
    document.getElementById("statusText").innerText = "監視中";
    document.getElementById("log").innerText = "Proシステム起動";
  } else {
    document.getElementById("statusText").innerText = "停止中";
    document.getElementById("log").innerText = "停止しました";
  }
}
</script>

</body>
</html>
