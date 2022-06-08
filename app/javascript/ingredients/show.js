// <%# モーダルを取得 %>
var modal = document.getElementById('modal');
// <%# # マスクを取得 %>
var mask = document.getElementById('mask');
// <%# 
// # モーダルの中身をshowビューに置き換えます。
// # 部分テンプレートのパス、localsの値はアプリにより異なります。 %>
modal.innerHTML = "<%= escape_javascript(render partial: 'shared/show' %>";

// <%# # hiddenクラスを消してモーダルとマスクを表示させます。 %>
modal.classList.remove('hidden');
mask.classList.remove('hidden');

// <%# # モーダルの外側（マスク）をクリックするとhiddenクラスが書き込まれ、モーダルとマスクが再び非表示となります。 %>
mask.addEventListener('click', () => {
  modal.classList.add('hidden');
  mask.classList.add('hidden');
  });