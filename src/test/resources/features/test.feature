@test5
Feature: shrtco

  @test2
  Scenario: Shortening a Link
    * url 'https://api.shrtco.de/v2/shorten?url=google.cl'
    #* request ''
    * method get
    * status 201
    * print response
    * match response.result.original_link == 'http://google.cl'
    * match response contains {ok: true}
    * print response.result.code

  @test3
  Scenario Outline:
    * url 'https://api.shrtco.de/v2/shorten?url=<url>'
    #* request ''
    * method get
    * status 201
    * print response
    * match response.result.original_link == 'http://<url>'
    * match response contains {ok: true}
    * print response.result.code

    Examples:
      | url         |
      | google.com  |