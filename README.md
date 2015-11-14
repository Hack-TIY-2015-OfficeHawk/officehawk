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
    * [Registration](#emp-new)
    * [List Employees](#emp-list)
    * [Update Employee](#emp-update)
    * [Delete Employee](#emp-delete)


##<a name="org-methods"></a>Organization Methods

###<a name="org-registration"></a>Registration

This request triggers creating a new organiztation as well as creating a new user who will be tagged as an admin.

**URL** /organizations

**Method** POST

**Request**
    

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | ​*(Required)*​  unique username.  This will also become the owner of the org/team |
| password    | String      |  ​*(Required)*​  Password for the user |
| name | String | ​*(Required)*​ Unique name of team/organization |


**Response**

If successful, you will receive:

    Status Code: 201 - Created
    
```json
    { "organization": 
            { "organization_id": 1,
              "name": "nameoforghere"
              "owner": "usernameofownerhere"
              "auth_token: "The Auth Token for the Owner"
            }
    }
            
```
​*As long as you get the above, the owner user was also succeesfully created.*​

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
| name  | String | ​*(Required)*​  unique organization name |
| owner     | String      |  ​*(Required)*​   Username of the org owner |


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
| organization_id  | Integer | ​*(Required)*​  The ID of the org you want to destroy |

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
    
​*There are no parameters required for this request.  Orgs are searchable by ID, Name and Owner (which will be a username from the Employees database)*​


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

###<a name="emp-new"></a>New

Sign up a new employee for your team/organization, must be logged in as an ADMIN user by providing their auth_token as a header

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

List all employees for an organization, must be logged in as an ADMIN user or provide the auth_token for one as a header

**URL** /employees

**Method** GET

**Headers**

auth_token *(Required)*

**Request**

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```json
{
  "employees": [
    {
      "id": 3,
      "username": "terri"
    },
    {
      "id": 4,
      "username": "mac"
    }
  ]
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

Update employee username, must be logged in as an ADMIN user by providing their auth_token as a header

**URL** /employees/:employee_id

**Method** PUT

**Headers**

auth_token *(Required)*

**Request**
	
| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  whatever you want to change the username to |

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
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

###<a name="emp-delete"></a>Delete Employee

Delete an employee from a team/org, must be logged in as an ADMIN user by providing their auth_token as a header

**URL** /employees/:employee_id

**Method** DELETE

**Request**
	
**Headers**

auth_token *(Required)*

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```json
{
  "success": "Employee delete successfully"
}		
```

If unsuccessful, you will receive:

	Status Code: 401 - Unauthorized
	
```json
{
  "errors": "You don't have permission to delete that employee"
}
```
