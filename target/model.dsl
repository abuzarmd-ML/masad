user = person "User" "A user of the Where's Fluffy? service."
petOwner = person "Pet Owner" "A user who has lost their pet and wants to post a missing pet report."
petFinder = person "Pet Finder" "A user who finds a pet and wants to post a found pet report."
generalPublic = person "General Public" "Users who can view and comment on pet reports."
communication = softwareSystem "Messaging Service"
reward = softwareSystem "Reward Service" "Fill the form with your bak details"


mainApp = softwareSystem "Where's Fluffy?" {
            container "Web Application" {
                description "Provides the main interface for users to interact with the service."
                technology "HTML, CSS, JavaScript"
            }
            user -> this "Web Application" "Interacts with"
            petOwner -> this "Web Application" "Posts missing pet reports"
            petFinder -> this "Web Application" "Posts found pet reports"
            generalPublic -> this "mobile Application" "Views and comments on pet reports"

        }


group "API"{
api = softwareSystem "Handles application logic and business rules."
database = softwareSystem "Stores pet reports, user data, and other relevant information."
notification = softwareSystem "Notification Service"
bankApi = softwareSystem "integration with payment Gateway"
facebook = softwareSystem "Facebook Login API" {
    description "Provides authentication services for the Where's Fluffy? application."
}
}

mainApp -> api "calls API"
user -> mainApp "Uses"
mainApp -> facebook "Login integration"
petFinder -> communication "i found your pet"
petOwner -> communication "can you call me?"
communication -> reward "Money will be sent within 24 hrs"
reward -> bankApi "Payment Gateway"
mainApp -> notification "New post notification on the dashboard"
mainApp -> database "store the data of pets"



# group "Post"{
# ownerPost = person "Pet Owner Post" "Whether your pet is missing ?"
# generalPost = person "Have You Lost/Find Pet ?" "Post the photo and location of Fluffy" "Pet owner, Pet Finder"
# }


# group "services" {
# application = softwaresystem "Where is Fluffy?"{
# registration = container "Registration of Users" "Register all the users, pet owners,pet finders,general public"
# generalPost = container "Have You Lost/Find Pet ?" "Post the photo and location of Fluffy" "Pet owner, Pet Finder"
# }
# # application -> generalPost "Asks questions to" "Telephone"
# }

# application.generalPost -> ownerPost "Post"
# ownerPost -> application.registration
# group "Rewards in person" {
#     email = softwaresystem "E-Mail" "Allows pet finders and pet owners to communicate"
#     email -> ownerPost "Sends e-mails to"

#     Phone = softwaresystem "Phone" "Allows pet finders and pet owners to communicate"
#     Phone -> ownerPost "communicate using"
# }

# group "Post for All"{
#     person1 = person "post1,comment1"
#     person2 = person "post1,comment2"
#     person3 = person "post2,comment1"
#     person4 = person "post2,comment2"
# }

# ownerPost -> person1
# ownerPost -> person2
# person1 -> email
# person2 -> phone
# person3 -> application.generalPost
# person4 -> application.generalPost

enduser = person "End User"
frontend = softwareSystem "DashBoard" "Front End (Web/mobile)"
group "backend"{
dataStorage = softwareSystem "data storage"
}
group "externalApi" {
    gpsService = softwareSystem "GPS"
    notificationService = softwareSystem "Notification"
    paymentService = softwareSystem "Payment"

}
enduser -> frontend
frontend -> gpsService
frontend -> notificationService
frontend -> paymentService
paymentService -> dataStorage
