Create a clean UML State Chart Diagram (State Machine Diagram) for the ScrapKart pickup request lifecycle.
Use a simple academic style with rounded rectangular states, thin borders, black arrows, and a white background.
Match the professional UML look used in software engineering project reports.

Title: ‘ScrapKart – Pickup Request State Machine Diagram’

States to include (top to bottom):

Created

Pending

Assigned

Driver En-Route

Picked Up

Weighing & Price Finalization

Completed

Cancelled (off to the side)

Transitions with labels:

Created → Pending : submitRequest()

Pending → Assigned : adminAssignDriver()

Assigned → Driver En-Route : driverAccepts()

Driver En-Route → Picked Up : confirmPickup()

Picked Up → Weighing & Price Finalization : updateWeight()

Weighing & Price Finalization → Completed : finalizeTransaction()

Any State → Cancelled : userCancel() or adminCancel()

Styling Requirements:

Minimalist UML state icons

Solid black arrows with arrowheads

Small text labels on transitions

Light-gray or white fill for states

Start node (black filled circle)

End node (black circle with white center)

Clean spacing between states

Resolution around 2000×1500 or higher.
