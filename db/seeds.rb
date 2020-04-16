# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Project.destroy_all
Team.destroy_all
Task.destroy_all

#TEAMS 
team1= Team.create(name: "Team {Browns}")
team2= Team.create(name: "Team Flatiron")

#USERS
u1 = User.create(name: "Lilly", age: "27", bio: "Ready to get rolling!", username: "lilly", password: "lpassword")
u2 = User.create(name: "Norris", age: "30", bio: "Did someone say 'Project'???", username: "norris", password: "npassword")
u3 = User.create(name: "Anne", age: "24", bio: "Nothing but finished tasks.", username: "anne", password: "apassword")
u4 = User.create(name: "Michael", age: "24", bio: "Project Master", username: "michael", password: "mpassword")
u5 = User.create(name: "Gina", age: "32", bio: "My kids are my life... sometimes.", username: "gina", password: "gpassword")
u6 = User.create(name: "Brandon", age: "28", bio: "Task Complete", username: "brandon", password: "bpassword")

#USERTEAMS
ut1 = Userteam.create(user_id: u1.id, team_id: team1.id)
ut2 = Userteam.create(user_id: u2.id, team_id: team1.id)
ut3 = Userteam.create(user_id: u3.id, team_id: team1.id)
ut4 = Userteam.create(user_id: u4.id, team_id: team2.id)
ut5 = Userteam.create(user_id: u5.id, team_id: team2.id)
ut6 = Userteam.create(user_id: u6.id, team_id: team2.id)
ut7 = Userteam.create(user_id: u1.id, team_id: team2.id)
ut8 = Userteam.create(user_id: u2.id, team_id: team2.id)


#PROJECTS 
#TEAM 1 PROJECTS
project1= Project.create(team_id: team1.id, name: "Kitchen Remodel", start_date: "2020-1-24", end_date: "2020-2-23", status: "Complete", description: "This is a description about the Kitchen Model project.")
project2=Project.create(team_id: team1.id, name: "Mod 1 Ruby Project", start_date: "2020-3-24", end_date: "2020-04-01", status: "Complete", description: "This is a description about the mod 1 Ruby project.")
project3= Project.create(team_id: team1.id, name: "Mod 2 Rails Project", start_date: "2020-4-13", end_date: "2020-04-17", status: "In Progress", description: "This is a description about the project.")
project4= Project.create(team_id: team1.id, name: "2020 Flatiron Reunion", start_date: "2020-4-13", end_date: "2020-10-25", status: "In Progress", description: "This is a description about the project.")
#TEAM 2 PROJECTS
project5=Project.create(team_id: team2.id, name: "Q1 Marketing Campaign", start_date: "2020-1-05", end_date: "2020-03-31", status: "In Progress", description: "This is a description about the project.")
project6= Project.create(team_id: team2.id, name: "Mod 2 Rails Project", start_date: "2020-4-13", end_date: "2020-04-17", status: "In Progress", description: "This is a description about the project.")



#TEAM 1 PROJECTS
#project 1
task1= Task.create(project_id: project1.id, creator_id: u1.id, assignee_id: u1.id, priority: "High", description: "Call a constractor to get a quote.", due_date:"2020-02-20", status: "Complete")
task2= Task.create(project_id: project1.id, creator_id: u1.id, assignee_id: u1.id, priority: "Medium", description: "Schedule demo day.", due_date:"2020-02-20", status: "Complete")
task3= Task.create(project_id: project1.id, creator_id: u1.id, assignee_id: u1.id, priority: "Low", description: "Buy magazines for kitchen ideas.", due_date:"2020-02-20", status: "Complete")

# #project 2
task4= Task.create(project_id: project2.id, creator_id: u2.id, assignee_id: u2.id, priority: "Medium", description: "Draft ideas and model for approval", due_date:"2020-02-20", status: "Complete")
task5= Task.create(project_id: project2.id, creator_id: u3.id, assignee_id: u3.id, priority: "Medium", description: "Pitch idea to flatiron team", due_date:"2020-02-20", status: "Complete")
task6= Task.create(project_id: project2.id, creator_id: u2.id, assignee_id: u2.id, priority: "High", description: "Build out bicycle version of app.", due_date:"2020-02-20", status: "In Progress")


# #project 3
task7= Task.create(project_id: project3.id, creator_id: u2.id, assignee_id: u2.id, priority: "Medium", description: "Draft ideas and model for approval", due_date:"2020-02-20", status: "Complete")
task8= Task.create(project_id: project3.id, creator_id: u3.id, assignee_id: u3.id, priority: "Medium", description: "Pitch idea to flatiron team", due_date:"2020-02-20", status: "Complete")
task9= Task.create(project_id: project3.id, creator_id: u2.id, assignee_id: u2.id, priority: "High", description: "Build out bicycle version of app.", due_date:"2020-02-20", status: "In Progress")


# #project 4
task10= Task.create(project_id: project4.id, creator_id: u3.id, assignee_id: u3.id, priority: "High", description: "Send out save the date", due_date:"2020-02-20", status: "In Progress")
task11= Task.create(project_id: project4.id, creator_id: u3.id, assignee_id: u3.id, priority: "Medium", description: "Plan schedule of events ", due_date:"2020-02-20", status: "Planned")
task12= Task.create(project_id: project4.id, creator_id: u3.id, assignee_id: u3.id, priority: "Low", description: "Send out reminders.", due_date:"2020-02-20", status: "Planned")


#TEAM 2 PROJECTS
# #project 5
task13= Task.create(project_id: project5.id, creator_id: u4.id, assignee_id: u4.id, priority: "High", description: "Submit first draft ideas for approval", due_date:"2020-04-20", status: "Complete")
task14= Task.create(project_id: project5.id, creator_id: u4.id, assignee_id: u5.id, priority: "High", description: "Create skateboard model", due_date:"2020-05-06", status: "In Progress")
task15= Task.create(project_id: project5.id, creator_id: u4.id, assignee_id: u5.id, priority: "Low", description: "Add stretch features", due_date:"2020-05-20", status: "Planned")

#project 6
task16= Task.create(project_id: project6.id, creator_id: u5.id, assignee_id: u5.id, priority: "Low", description: "Create the homepage for website", due_date:"2020-04-20", status: "In Progress")
task17= Task.create(project_id: project6.id, creator_id: u6.id, assignee_id: u6.id, priority: "Medium", description: "Create form pages", due_date:"2020-04-30", status: "Planned")
task18= Task.create(project_id: project6.id, creator_id: u5.id, assignee_id: u5.id, priority: "High", description: "Launch application", due_date:"2020-05-6", status: "Planned")


