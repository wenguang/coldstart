<html>
<body>

<h2>Hello World!</h2>
<button onclick="fuck()">click</button>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
    function fuck2() {
        // alert()
        axios.post('http://localhost:1111/sso/login', {'username':'zheng','password':'123'}).then(function (response) {
            console.log(response);
        }).catch(function (error) {
            console.log(error);
        });
    }
    function fuck() {
        // alert()
        var requestObj = new XMLHttpRequest();
        var sendData = JSON.stringify({'username':'zheng','password':'123'});
        requestObj.open('POST', 'http://localhost:1111/sso/login', true);
        /*
            从chrome的调试工具上看到：
            当Context-type设置application/x-www-form-urlencoded时，sendData出现在请求的Form Data中，
            而当Context-type设置为application/json时，sendData出现在请求的Request Payload中
            什么是Request Payload：https://stackoverflow.com/questions/22069844/request-payload-and-request-body
         */
        requestObj.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=UTF=8");
        // requestObj.setRequestHeader("Content-type", "application/json");
        requestObj.send(sendData);

        requestObj.onreadystatechange = function() {
            if (requestObj.readyState == 4) {
                if (requestObj.status == 200) {
                    var obj = requestObj.response
                    if (typeof obj !== 'object') {
                        obj = JSON.parse(obj)
                        console.log(obj)
                    }
                } else {
                    console.log('error')
                }
            }
        }
    }
</script>
</body>
</html>
