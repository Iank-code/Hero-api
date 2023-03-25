# Restaurant Api

This is a backend project made by Ruby On Rails. It provides all data belonging to `Hero`, `Power` and its joining table `Hero_Power`

## Ruby version

- Ruby 2.7.4

## Dependencies

- Faker
- Active_model_serializers
- sqlite3
- Rake

## How to run

To be able to use it, you will need to clone it into your machine using the following command.

    git clone git@github.com:Iank-code/Hero-api.git
    cd Hero-api
    bundle install
    rails db:migrate db:seed
    rails s

This will also start the server which will listen on port 3000

```
http://127.0.0.1:3000
```

## Routes

GET

    /heros

Returns all heros

GET

    /heros/:id

Return the specific `Hero` you want with its associated powers.
The output will be similar to this

        {
        "id": 1,
        "name": "Ian",
        "super_name": "Flash",
        "powers": [
            {
            "id": 1,
            "name": "Speed",
            "description": "I am the fastest human to ever live"
            }
        ]
        }

If the `Hero` does not exist, it returns the following JSON data, along with
the appropriate HTTP status code:

    {
    "error": "Hero not found"
    }

<!-- DELETE

    /heros/:id

If the `Hero` exists, it removes it from the database, along with
any `Power`s that are associated with it.

After deletion, it will return an _empty_ response body, along with the
appropriate HTTP status code. -->

GET

    /powers

Return all the powers.

Get

    /powers/:id

This returns a specific `power`. The output structure should be similar to this;

        {
        "id": 1,
        "name": "Speed",
        "description": "I am the fastest human to ever live"
        }

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Power not found"
}
```

PATCH
    
    /powers/:id

This route updates an existing `Power`. It accepts an object with
the following properties in the body of the request:

    {
    "name": "updated power name",
    "description": "Updated description"
    }

If the process is successful, it will return a status code of `200`
If the `Power` does not exist, return the following JSON data, along with status code of `404`:

```
{
  "error": "Power not found"
}
```

If the `Power` is **not** updated successfully (does not pass validations),
it returns the following JSON data, along with status code of `200`:

```
{
  "errors": ["validation errors"]
}
```

POST

    /hero_powers

This route creates a new **HeroPower** that is associated with an
existing `Power` and `Hero`. It accepts an object with the following properties;

    {
    "strength": 2,
    "power_id": 1,
    "hero_id": 3
    }

The `strength` key is anumber by default. Each number represents either `[:STRONG, :WEAK, :AVERAGE]`. **STRONG** is represented by number 0, **WEAK** is represented by number 1, **STROAVERAGENG** is represented by number 2.

If the `HeroPower` is created successfully, send back a response with the data
related to the `Hero` in the format below

    {
    "id": 5,
    "name": "Brandee Lynch",
    "super_name": "Cable",
    "powers": [
        {
        "id": 3,
        "name": "Hypnokinesis",
        "description": "Perferendis maiores earum. Rerum ipsa voluptatem. Vero necessitatibus incidunt.",
        "created_at": "2023-03-25T04:50:29.654Z",
        "updated_at": "2023-03-25T04:50:29.654Z"
        }
    ]
    }

If the `HeroPower` is **not** created successfully, it will return the json data with the status code:

    {
    "errors": ["validation errors"]
    }

<!-- POST

    /hero_powers

The models should have the following attributes (along with any attributes
needed to create the relationships defined above):

This route creates a new `RestaurantPizza` that is associated with an
existing `Pizza` and `Restaurant`.

If the `RestaurantPizza` is **not** created successfully, it will return a
JSON data, along with the appropriate HTTP status code:
Make sure to define validations for your models so that no bad data can be saved
to the database.

```
{
  "errors": ["validation errors"]
}
``` -->

## LICENCE

This project is licensed under the MIT license.

```
Copyright (c) 2023 Ian Kamau
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
