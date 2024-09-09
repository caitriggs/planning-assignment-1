(define (domain king)
  (:requirements :strips)
  (:predicates
    (at ?p ?x ?y)        ;; The piece ?p is at coordinates ?x, ?y
    (adjacent ?v1 ?v2)   ;; Coordinates ?v1 and ?v2 are adjacent
    (occupied ?x ?y)     ;; The square at coordinates ?x, ?y is occupied
  )
  (:action move
    :parameters (?p ?x1 ?y1 ?x2 ?y2)
    :precondition (and
      (at ?p ?x1 ?y1)              ;; The piece ?p is at coordinates ?x1, ?y1
      (not (occupied ?x2 ?y2))     ;; The destination square is not occupied
      (or
        (and (= ?x1 ?x2) (adjacent ?y1 ?y2))  ;; Move in the y direction, x stays the same
        (and (= ?x1 ?x2) (adjacent ?y2 ?y1))  ;; Move in the y direction, x stays the same
        (and (= ?y1 ?y2) (adjacent ?x1 ?x2))  ;; Move in the x direction, y stays the same
        (and (= ?y1 ?y2) (adjacent ?x2 ?x1))  ;; Move in the x direction, y stays the same
        (and (adjacent ?x1 ?x2) (adjacent ?y1 ?y2)) ;; Diagonal movement
      )
    )
    :effect (and
      (not (at ?p ?x1 ?y1))        ;; The piece is no longer at the original location
      (at ?p ?x2 ?y2)              ;; The piece is now at the destination location
      (occupied ?x2 ?y2)           ;; The destination square becomes occupied
      (not (occupied ?x1 ?y1))    ;; The starting square becomes unoccupied
    )
  )
)
