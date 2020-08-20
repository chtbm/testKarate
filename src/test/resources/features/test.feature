@testFull
Feature: shrtco

  @test1
  Scenario: Shortening a Link
    * url 'https://api.shrtco.de/v2/shorten?url=google.com'
    #* request ''
    * method get
    * status 201
    * print response

    #validar que el campo original_link sea igual a ...
    * match response.result.original_link == 'http://google.com'

     #validar que el campo 'ok' contenga como valor true
    * match response contains {ok: true}

    #Mostrar el valor del campo 'code'
    * print response.result.code


  @test2
  Scenario Outline: Shortening a Link
    * url 'https://api.shrtco.de/v2/shorten?url=<url>'
    #* request ''
    * method get
    * status 201
    * print response

    #validar que el campo original_link sea igual a ...
    * match response.result.original_link == 'http://<url>'

    #validar que la respuesta contenga en el campo 'ok' el valor de valor1 (Examples)
    * match response contains {ok: <valor1>}

    #Mostrar el valor del campo 'code'
    * print response.result.code

    Examples:
      | url         | valor1 |
      | google.com  | true   |
      | twitter.com | true   |


