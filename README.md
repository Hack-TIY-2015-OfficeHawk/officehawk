# office hawk api

Welcome to the office hawk API docs!

**Methods**

* [Organization Methods](#org-methods)
	* [Registration](#org-registration)
	* [Editing](#org-edit)
	* [Deleting](#org-delete)
	* [Listing Registered Orgs](#org-index)

	
* [Employee Methods](#emp-methods)
	* [Login](#emp-login)
	* [Registration](#emp-registration)


##<a name="org-methods"></a>Organization Methods

###<a name="org-registration"></a>Registration

Register a new organization

**URL** /organizations

**Method** POST

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| name  | String | *(Required)*  unique organization name |
| owner     | String      |  *(Required)*   Username of the org owner |


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "organization": 
			{ "organization_id": 1,
			  "name": "nameoforghere"
			  "owner": "usernameofownerhere"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"Organization has already been taken",
				]
	}
```

###<a name="org-edit"></a>Editing

Editing the owner and/or name of an organization.  The :id in the route refers to the organization's unique id (organization.id)

NOTE: for owner parameter, the username must be EXACTLY THE SAME AS THE USERNAME USED TO REGISTER THE EMPLOYEE!  Misspelled usernames will throw an error when trying to change owners/admins

**URL** /organizations/:id

**Method** PUT

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| name  | String | *(Required)*  unique organization name |
| owner     | String      |  *(Required)*   Username of the org owner |


**Response**

If successful, you will receive:

```Nothing.  And be thankful for it.```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"What you messed up will be in here",
				]
	}
```

###<a name="org-delete"></a>Deleting an Org

Deleting an org (v2: and all associated entities)

**URL** /organizations

**Method** DELETE

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| organization_id  | Integer | *(Required)*  The ID of the org you want to destroy |

**Response**

If successful, you will receive:

```A very sad message about how you destroyed everything.```

If unsuccessful, you will receive:

`A whole lot of nothing because really how could you screw this up?`

###<a name="org-index"></a>List All Organizations

Get a list of all registered organizations

**URL** /organizations

**Method** GET

**Request**
	
*There are no parameters required for this request.  Orgs are searchable by ID, Name and Owner (which will be a username from the Employees database)*


**Response**

If successful, you will receive a list of all registered organizations:

	Status Code: 200 - OK
	
```json
	{ "organization": 
			{ "organization_id": 1,
			  "name": "nameoforghere"
			  "owner": "usernameofownerhere"
			}
	}
			
```

If unsuccessful, you will receive:

`Probably nothing.  Nobody has ever failed this.`

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

