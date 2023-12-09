A major part of the challenge of architecting UI-focused code bases tends to come down to deciding where to draw the line between the code that needs to interact with the platform’s various UI frameworks, versus code that’s completely within our own app’s domain of logic.

That task might become especially tricky when working with SwiftUI, as so much of our UI-centric logic tends to wind up within our various View declarations, which in turn often makes such code really difficult to verify using unit tests.
