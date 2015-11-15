# Office Hawk API

[![Build Status](https://travis-ci.org/Hack-TIY-2015-OfficeHawk/officehawk.svg?branch=master)](http://travis-ci.org/Hack-TIY-2015-OfficeHawk/officehawk)

Welcome to the Office Hawk API docs!

We're watching you...

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
    * [List Employee Alerts](#emp-show)
    * [Update Employee](#emp-update)
    * [Delete Employee](#emp-delete)

* [Alert Methods](#alert-methods)
	* [New Alert](#alert-new)
	* [Delete Alert](#alert-delete)
	* [Index of Alerts](#alert-index)

* [Beacon Methods](#bcn-methods)
	* [New Beacon](#bcn-new)
	* [Beacon List](#bcn-index)
	* [Editing a Beacon](#bcn-update)
	* [Deleting a Beacon](#bcn-destroy)


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

*HEADERS*: 

auth-token *(Required)*
    

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
| username | String | *(Required)*  existing employee's username for the organiation id provided |
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

auth-token *(Required)*

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

###<a name="emp-show"></a>Display Employee Alert Data

Display all alerts for a given employee ID

**URL** /employees/:id

**Method** GET

**Headers**

auth-token *(Required)*

**Request**

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```json
{
  "alert": [
    {
      "id": 1,
      "state": "near",
      "beacon_id": 4,
      "beacon_uuid": "4B91A9DF-B7D0-CBA4-096B-9EAE45837F02",
      "beacon_minor": "1000",
      "beacon_major": "100",
      "duration": 20
    },
    {
      "id": 2,
      "state": "far",
      "beacon_id": 4,
      "beacon_uuid": "4B91A9DF-B7D0-CBA4-096B-9EAE45837F02",
      "beacon_minor": "1000",
      "beacon_major": "100",
      "duration": 20
    },
    {
      "id": 3,
      "state": "near",
      "beacon_id": 4,
      "beacon_uuid": "4B91A9DF-B7D0-CBA4-096B-9EAE45837F02",
      "beacon_minor": "1000",
      "beacon_major": "100",
      "duration": 20
    }
  ]
}
			
```

If unsuccessful, you will receive:

	Status Code: 401 - Unauthorized
	
```json
{
  "errors": "you betta be logged in to do that!"
}
```

###<a name="emp-update"></a>Update Employee

Update employee username, must be logged in as an ADMIN user by providing their auth_token as a header

**URL** /employees/:employee_id

**Method** PUT

**Headers**

auth-token *(Required)*

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

auth-token *(Required)*

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
##<a name="alert-methods"></a>Alert Methods

###<a name="alert-new"></a>New Alert

This logs the alert for a given employee.  This is triggered when an employee enters the range of a beacon and/or moves closer or further from it.

**URL** /alerts

**Method** POST

**Request**

*Headers*

auth-token *(Required)*
    

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| uuid | integer | ​*(Required)*​ The UUID for the beacons   |
| major | String      |  ​*(Required)*​  Customizable in V2.0 |
| minor | String | ​*(Required)*​ Customizable in V2.0 |
| state | String | *(Required)* Signifies the distance from the beacon the employee is.  Sent from the beacons. |
| duration | integer | *(Required)* Length of time in seconds an employee has been in a given zone |



**Response**

If successful, you will receive:

    A colorful message about how great you've done.   

If unsuccessful, you will receive:

    A whole bunch of gibberish you probably won't understand.  Try not to ask too many questions.  It will be in json format.

###<a name="alert-delete"></a>Deleting an Alert

In the EXTREMELY rare occurrance you need to delete an alert - for instance, to cover your tracks because you are an unethical tyrant - this method provies the ability to do so.  Deletes an alert from the databas.

**URL** /alerts

**Method** DELETE

**Request**

*Headers*

auth-token *(Required)*

**Response**

If successful, you will receive:

    Nothing.  Absolutely nothing. 

If unsuccessful, you will receive:

    A stern talking to because how could you screw this up?

###<a name="alert-index"></a>Index of Alerts

For displaying all active alerts and updates.  This is where the bulk of the work and information is displayed.

**URL** /alerts

**Method** GET

**Request**

*Headers*

auth-token *(Required)*

**Response**

If successful, you will receive:

``` A bunch of code. ```

If unsuccessful, you will receive:

    An error message telling you exactly what you screwed up, you amateur.  
    
##<a name="bcn-methods"></a>Beacon Methods

###<a name="bcn-new"></a>Adding a new Beacon

This allows you to add a new beacon to your organization, which will allow you to track alerts from a new zone.

NOTE:
Major and Minor can be considered equivalent to "room" and "place in the room".  

For example: MAJOR = Kitchen, Minor = Coffee Maker

**URL** /beacons

**Method** POST

**Request**

*Headers*

auth-token *(Required)*
    

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| uuid  | String | ​*(Required)*​ The UUID of the beacon |
| major | String      |  ​*(Required)* The major identifier, customizable in V2.0 |
| minor | String | ​*(Required)*​ The minor identifier, customizable in V2.0 |
| organization_id | integer | *(Required)* The id of the organization the beacons are registered to |


**Response**

If successful, you will receive:

    Status Code: 201 - Created
    
```
json.success "Beacon created successfully"
json.beacon_id @beacon.id            
```


If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
    {"errors":[
                "YOU FUCKED UP",
                ]
    }
```

###<a name="bcn-update"></a>Edit a Beacon

This will return a list of all organization-registered beacons and their associated information.

**URL** /beacons/:id

**Method** PUT

**Request**

*Headers*

auth-token *(Required)*

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| uuid  | String | ​*(Required)*​ The UUID of the beacon |
| major | String      |  ​*(Required)* The major identifier, customizable in V2.0 |
| minor | String | ​*(Required)*​ The minor identifier, customizable in V2.0 |
| organization_id | integer | *(Required)* The id of the organization the beacons are registered to |

**Response**

If successful, you will receive:

```
json: { success: "Beacon updated successfully" }, status: :ok
        
```


If unsuccessful, you will receive:

    Status Code: 404
    
```json
    {"errors":[
                "YOU FUCKED UP.  Check your parameters and try again.
                ]
    }
```

###<a name="bcn-index"></a>List of all Beacons

This will return a list of all organization-registered beacons and their associated information.

**URL** /beacons

**Method** GET

**Request**

**Response**

If successful, you will receive:

```
json.beacons do
  json.array!(@beacons) do |beacon|
    json.extract! beacon, :id, :uuid, :major, :minor
  end
end
        
```


If unsuccessful, you will receive:

    Status Code: 404
    
```json
    {"errors":[
                "YOU FUCKED UP.  Probably aren't looking for the right things...or you aren't authorized.  Either way, the Hawk has been notified.  Run while you can.",
                ]
    }
```

###<a name="bcn-destroy"></a>Delete a Beacon

In the event you need to delete a beacon, this is the way to do it.

**URL** /beacons/:id

**Method** DELETE

**Request**

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| beacon_id  | integer | ​*(Required)*​ The unique ID of the beacon you'd like to delete |

**Response**

If successful, nothing happens.  What, you want a pretty status message or something?

If unsuccessful, you should probably not be messing around with back-end commands, fam.
