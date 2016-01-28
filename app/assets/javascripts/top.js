//グローバル変数
var syncerTimeout = null;

//一連の処理
$(function()
{
  //スクロールイベントの設定
  $(window).scroll(function()
  {
    //1秒ごとに処理
    if(syncerTimeout == null)
    {
      //セットタイムアウトを設定
      syncerTimeout = setTimeout(function(){

        //対象の要素
        var element = $('#page-top');

        //現在、表示されているか？
        var visible = element.is(':visible');

        //最上部から現在位置までの距離取得して、変数[now]に格納
      })
    }
  })
  //クリックイベントを設定
  $('#move-page-top').click(
    function()
    {

      //スムーズにスクロールする
      $('html,body').animate({scrollTop:0}, 'slow');
    }
  );
});
