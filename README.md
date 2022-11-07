# TASK

Hello! Thank you for taking time to review this code. The goal of the test is to show my coding and little bit design skills

- There are no pods or any third party services has been used or consumed, so just open `PhotosApp.xcodeproj` on Xcode
- Custom Dependency Injection has been used to use the proper testing
- MVVM-C was used in this project
- In unit test, mock network layer was used to get the data from json file but for app development normal network request has been consumed
- Unit test for `DummyPhotoRepository` was written to showcase 

### What can further be done
- ActivityIndicator can be added on `DummyPhotosListViewController` and `DummyPhotoDetailViewController` to show that data is fetching from server
- An Error Label or Toast can be added on `DummyPhotosListViewController` and `DummyPhotoDetailViewController` to show error to the user for better user experience
- UI wasn't focused on this task, improved UI can be implemented
- Network Request and Image caches can be implemented
- Multiple schemes and configuration can be created for production use
- .gitignore file can be added 

### Just to clear
This naming `DummyPhoto` is used because it may be conflicted in the idea of the team that we are using native Photo or might be a Photo object which can have image file

### API Details
The server at the following url responds with JSON formatted data:
```
(GET) https://jsonplaceholder.typicode.com/photos
```
The response represents a list of photo objects:
```
[ {
}, {
"albumId": 1,
"id": 2,
"title": "reprehenderit est deserunt velit ipsam",
"url": "https://via.placeholder.com/600/771796", "thumbnailUrl": "https://via.placeholder.com/150/771796"
},
<...>
]
```
The following url returns a single entry for a given id:
```
https://jsonplaceholder.typicode.com/photos/{id}
```
