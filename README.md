# To Do API

## Versions
below are the versions used to create this app
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
- Rails 7.0.4.2
- node v19.3.0
- yarn 1.22.19
- database: postgres (PostgreSQL) 15.1

## Getting Started

Clone the repo:
```sh
git@github.com:desoto13/todo_api.git
```

Run the bundler
```sh
bundle install
```

Assuming the postgresql has already been setup with the app, intiate the database
```sh
pg_ctl start
(Note: kindly create a postgres user profile to_do_tasks via postgres CLI) 
rails db:create
```
Run the migrations
```sh
rails db:migrate
```

## Running the app
Seeding the tasks (There should be a total of 7 tasks)
```sh
rails db:seed
```
Run the server
```sh
rails s
```

## API definitions
To simulate the drag and dropping of tasks, the following is assumed:

`id` - the id number the task

`target position ids` - the id numbers of the tasks with format "[2,8,3]" or "[7,1]"

"[2,8,3]" - This format indicates that the task with `id` = 8 is being repositioned to move between the tasks of ids = 2 & 3. Please do take note that the middle `id` should be the same as the path_params for the endpoints

"[7,1]" - This format indicates that the task with `id` = 7 is being repositioned to replace or move before the task with id = 1. Please do take note that the `id` at index[0] should be the same as the path_params for the endpoints

Special Case when moving the task at the end/bottom most:
"[8,2]" - This format indicates that the task with `id` = 2 is being repositioned move after the task with id = 8. Please do take note that the `id` at index[1] should be the same as the path_params for the endpoints



| VERB | Endpoints | Body Params | Description |
|:----:|:---------:|:-----------:|:-----------:|
| GET | /api/v1/tasks | N/A | List all of the tasks |
| POST | /api/v1/tasks | { "name": `task name`, "description": `task description` } | Create a task |
| PATCH/PUT | /api/v1/tasks/`id` | { "name": `task name`, "description": `task description` } | Update a task |
| DELETE | /api/v1/tasks/`id` | N/A | Delete a task |
| POST | /api/v1/tasks/`id`/move_task | { "target_position_ids": `target position ids` | Move a task |


