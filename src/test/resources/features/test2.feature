Feature:

  #El background se ejecuta siempre previo a la ejecucion del Scenario
  Background:
    # definimos que la variable 'Objeto' sea igual a la clase 'Url' de la carpeta java
    * def Objeto = Java.type('Url')

    # Definimos que la variable 'page' sea igual al valor retornado por el metodo obtenerUrl() de la clase Url
    * def page = Objeto.obtenerUrl()

    #Se define la url del microservicio (MS) con el valor de la variable 'page'
    * url 'https://api.shrtco.de/v2/shorten?url=' + page
    * method get
    * status 201

    #definimos la variable code con el valor de la respuesta del microservicio
    * def code = response.result.code

  @test3
  Scenario: Caso 3
    # Definimos la url utilizando el valor de la variable code obtenida en el Background
    * url 'https://api.shrtco.de/v2/info?code='+ code
    * method get
    * status 200
    * print response

    #Validamos Schema (Se valida el tipo de dato para cada campo de la respuesta del microservicio)
    * match response contains
    """
    {
    "ok": #boolean,
    "result": {
        "code": "#string",
        "url": "#string",
        "password_protected": #boolean,
        "blocked": #boolean,
        "block_reason": null,
        "created": "#string",
        "timestamp": #number
    }
}
    """