# How to build and run the sample

## How to build the sample

From this directory, run

```
mvn clean install
docker build . -t vets:1.0.0
```

## How to run the sample

From the target directory, run
```
docker-compose up
```

## How to test the sample

We will use the cURL command line tool for testing. You can use your preferred HTTP or REST client too.
This was only tested on a MacBook Pro, so if you are using Windows or Linux, please adapt accordingly


1.) Adding a veterinarian

``` 
curl -v -H "Content-Type: application/json" -X POST -d '{"firstName":"Joao","lastName":"Emilio"}' http://localhost:8080/vets
```

```
You should able to see following output. 

```
Note: Unnecessary use of -X or --request, POST is already inferred.
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 8080 (#0)
> POST /vets HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.54.0
> Accept: */*
> Content-Type: application/json
> Content-Length: 40
> 
* upload completely sent off: 40 out of 40 bytes
< HTTP/1.1 201 Created
< Connection: keep-alive
< Content-Length: 0
< 
* Connection #0 to host localhost left intact
```

2.) Get details of veterinarian

```
curl -X GET  http://localhost:8080/vets/1 | python -m json.tool
```
You should able to see following output.

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    65  100    65    0     0   1685      0 --:--:-- --:--:-- --:--:--  1710
{
    "firstName": "James",
    "id": 1,
    "lastName": "Carter",
    "specialties": []
}
```


3.) Delete a veterinarian

```
curl -v  -X DELETE  http://localhost:8080/vets/7
```

You should able to see following output.
``` 
 HTTP/1.1 202 Accepted
``` 

4.) Try to get the details of non-existing veterinarian

``` 
curl -v  -X GET  http://localhost:8080/catalog/7
 ```
 
 You should able to see following output.
 
```  
 HTTP/1.1 404 Not Found
Problem accessing: /catalog/7. Reason: Not Found
 ``` 