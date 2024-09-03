(define (domain cake)
  (:requirements :strips)
  (:predicates
    (have ?c)      ; Represents having a cake
    (eaten ?c)     ; Represents the cake being eaten
    (dirty_pan)    ; Represents the cake pan being dirty
  )
  (:action eat
    :parameters (?c)
    :precondition (have ?c) ; You must have cake to eat it
    :effect (and
      (not (have ?c))       ; After eating, you no longer have cake
      (eaten ?c)            ; And now the cake is in the eaten state
    )
  )
  (:action bake
    :parameters (?c)
    :precondition (and 
      (not (have ?c))       ; You can only bake if you don't have a cake
      (not (dirty_pan))     ; You can only bake if the cake pan is not dirty
    )
    :effect (and
      (have ?c)             ; After baking, you now have a cake
      (dirty_pan)           ; and the pan is no longer clean
    )
  )
  (:action clean
    :parameters ()
    :precondition (dirty_pan)     ; Cleaning can only happen after the pan is dirty
    :effect (not (dirty_pan))     ; The pan is now clean               (@caitriggs)
  )
)
