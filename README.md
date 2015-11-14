# office hawk api

Welcome to the office hawk API docs!

**Methods**

* [Organization Methods](#org-methods)
	* [Registration](#org-registration)

	
* [Employee Methods](#emp-methods)
	* [Login](#emp-login)
	* [Registration](#emp-registration)


##<a name="org-methods"></a>Organization Methods

###<a name="org-registration"></a>Registration

Register a new organization.  This is handled from the Welcome Screen: a new employee

**URL** /<PUT ROUTE HERE>

**Method** < GET POST PATCH OR DELETE>

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  unique username |
| fullname      | String      |  *(Required)*   User's first and last name |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1,
			  "access_key": "biglongaccesskeyhere"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"Email has already been taken",
				"Username has already been taken"
				]
	}
```

##<a name="emp-methods"></a>Employee Methods

###<a name="emp-registration"></a>Registration

Register a new employee

**URL** /<PUT ROUTE HERE>

**Method** < GET POST PATCH OR DELETE>

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  unique username |
| fullname      | String      |  *(Required)*   User's first and last name |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1,
			  "access_key": "biglongaccesskeyhere"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"Email has already been taken",
				"Username has already been taken"
				]
	}
```

