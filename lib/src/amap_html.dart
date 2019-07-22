class AmapHtml {
  static const HTML = '''
  <html>
  <head>
      <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
      <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=您申请的key值"></script>
      <script>
      window.onLoad  = function(){
          var map = new AMap.Map('container', {
            zoom: zoomValue
          });
      }
      var url = 'https://webapi.amap.com/maps?v=1.4.15&key=您申请的key值&callback=onLoad';
      var jsApi = document.createElement('script');
      jsApi.charset = 'utf-8';
      jsApi.src = url;
      document.head.appendChild(jsApi);
      </script>
      <style type="text/css">
        #container {
          width: 100%;
          height: 100%;
        }
        
        * {
          margin: 0;
          padding:0
        }
    </style>
  </head>
  <body>
  <div id="container"></div>
  </body>
  </html>
  ''';
}
