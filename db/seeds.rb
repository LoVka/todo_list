User.create!([
  {email: "lovkavo@gmail.com", password: "12345678", password_confirmation: "12345678"}
])
Project.create!([
  {user_id: 1, name: "Complete the test task for Ruby Garage"},
  {user_id: 1, name: "For Home"}
])
Task.create!([
  {project_id: 1, name: "Add Javascript to implement adding / editing / removing for todo items and lists taking into account as more use cases as possible", status: "unstarted", priority: 4, deadline: "2014-09-10 00:00:00"},
  {project_id: 2, name: "Repair the DVD Player", status: "unstarted", priority: 4, deadline: "2014-09-07 20:00:00"},
  {project_id: 1, name: "Write HTML & CSS", status: "compleated", priority: 3, deadline: "2014-09-10 00:00:00"},
  {project_id: 2, name: "Clean the room", status: "unstarted", priority: 3, deadline: "2014-09-04 00:00:00"},
  {project_id: 1, name: "Attentively check the file", status: "compleated", priority: 2, deadline: "2014-09-10 00:00:00"},
  {project_id: 2, name: "Call Mam", status: "started", priority: 2, deadline: nil},
  {project_id: 1, name: "Open this mock-up in Adobe Fireworks", status: "compleated", priority: 1, deadline: "2014-09-10 00:00:00"},
  {project_id: 2, name: "Buy a milk", status: "started", priority: 1, deadline: nil}
])
