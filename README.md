# office hawk api

Welcome to the office hawk API docs!

**Methods**

* [Organization Methods](#org-methods)
	* [Registration](#org-registration)

	
* [Employee Methods](#emp-methods)
	* [New](#emp-new)
	* [Login](#emp-login)
	* [List Employees](#emp-list)
	* [Update Employee](#emp-update)

##<a name="org-methods"></a>Organization Methods

###<a name="org-registration"></a>Registration

Register a new organization

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

###<a name="emp-new"></a>New

Sign up a new employee for your team/organization

**URL** /employees

**Method** POST

**Headers**

auth_token *(Required)*

**Request**
	
| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  unique username per organization (within an organizations two users cannot have the same username) |
| password | String | *(Requred)* employee's password |

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
{
  "success": "dan created successfully",
  "username": "dan",
  "auth_token": "f74ef72a9c26cc05ac181aab3083521f"
}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"Username has already been taken",
				]
	}
```

###<a name="emp-login"></a>Login

Login an existing employee

**URL** /employees/login

**Method** POST

**Request**
	
| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  existing employee's username for the organiation id provided |
| password | String | *(Requred)* employee's password |

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
{
  "success": "dan logged in successfully",
  "username": "dan",
  "auth_token": "f74ef72a9c26cc05ac181aab3083521f"
}
			
```

If unsuccessful, you will receive:

	Status Code: 401 - Uauthorized
	
```json
{
  "errors": "username or password incorrect"
}
```

###<a name="emp-list"></a>List Employees for an Org

List all employees for an organization, must be logged in as an ADMIN user

**URL** /organizations/:organization_id/employees

**Method** POST

**Request**
	
| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  existing employee's username for the organiation id provided |
| password | String | *(Requred)* employee's password |

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
{
  "success": "dan logged in successfully",
  "username": "dan",
  "auth_token": "f74ef72a9c26cc05ac181aab3083521f"
}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
{
  "errors": "username or password incorrect"
}
```

###<a name="emp-update"></a>Update Employee

Update employee username, must be logged in as an ADMIN user

**URL** /employees/:employee_id

**Method** PUT

**Request**
	
| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  whatever you want to change the username to |

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
{
  "success": "Employee updated successfully"
}		
```

If unsuccessful, you will receive:

	Status Code: 401 - Unauthorized
	
```json
{
  "errors": "You don't have permission to update that employee"
}
```
