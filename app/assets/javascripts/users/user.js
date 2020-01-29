// #2と#14消しても大丈夫
$(function() {
  $(document).on('turbolinks:load', () => {
    $('#user_postcode').jpostal({
      postcode : [
        '#user_postcode'
      ],
      address: {
        "#user_prefecture_code": "%3", // # 都道府県が入力される
        "#user_address_city"           : "%4%5", // # 市区町村と町域が入力される
        "#user_address_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});


function initMap() {
  //地図を表示する領域の div 要素のオブジェクトを変数に代入
  var target = document.getElementById('map');
  //HTMLに記載されている住所の取得
  var address = document.getElementById('address').textContent;
  //ジオコーディングのインスタンスの生成
  var geocoder = new google.maps.Geocoder();
  // map.getCenterで使う為にmapを宣言
  var map;

  //geocoder.geocode() にアドレスを渡して、コールバック関数を記述して処理
  geocoder.geocode({ address: address }, function(results, status){
    //ステータスが OK で results[0] が存在すれば、地図を生成
        if (status === 'OK' && results[0]){
          // map.getCenterで使う為にmapに地図を入れる
          map = new google.maps.Map(target, {
          //results[0].geometry.location に緯度・経度のオブジェクトが入っている
            center: results[0].geometry.location,
            zoom: 14
          });
          var marker = new google.maps.Marker({
            position: map.getCenter(),
            map: map
          });

        }else{
       //ステータスが OK 以外の場合や results[0] が存在しなければ、アラートを表示して処理を中断
          alert('失敗しました。理由: ' + status);
          return;
        }
    });

  }