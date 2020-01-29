
// function initMap(){
//   let map = new google.maps.Map(document.getElementById('map'), {
//   center: {lat: -34.397, lng: 150.644},
//   zoom: 8
//   });
// }


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