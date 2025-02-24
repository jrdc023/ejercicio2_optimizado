Feature: Pruebas API en PetStore - Gestión de Usuario

  Background:
    * url "https://petstore.swagger.io/v2"
    * def userId = "12345"
    * def requestBody =
    """
    {
      "id": "#(userId)",
      "username": "testuser",
      "firstName": "John",
      "lastName": "Doe",
      "email": "john.doe@example.com",
      "password": "password123",
      "phone": "123456789",
      "userStatus": 1
    }
    """

  Scenario: Crear un usuario en la PetStore
    Given path "/user"
    And request requestBody
    When method POST
    Then status 200
    And match response.message == userId

  Scenario: Buscar el usuario creado
    Given path "/user/testuser"
    When method GET
    Then status 200
    And match response.username == "testuser"
    And match response.email == "john.doe@example.com"

  Scenario: Actualizar el nombre y el correo del usuario
    * def updatedBody =
    """
    {
      "id": "#(userId)",
      "username": "testuser",
      "firstName": "Jane",
      "lastName": "Smith",
      "email": "jane.smith@example.com",
      "password": "password123",
      "phone": "987654321",
      "userStatus": 1
    }
    """
    Given path "/user/testuser"
    And request updatedBody
    When method PUT
    Then status 200
    And match response.message == userId

  Scenario: Buscar el usuario actualizado
    Given path "/user/testuser"
    When method GET
    Then status 200
    And match response.firstName == "Jane"
    And match response.email == "jane.smith@example.com"

  Scenario: Eliminar el usuario
    Given path "/user/testuser"
    When method DELETE
    Then status 200
