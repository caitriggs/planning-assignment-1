(define (domain single-knight-domain)
  (:requirements :strips)
  (:predicates
    (at ?p ?x ?y)                ;; The piece ?p is at coordinates ?x, ?y
    (occupied ?x ?y)             ;; The square at coordinates ?x, ?y is occupied
    (delta1 ?v1 ?v2)             ;; Coordinates ?v1 and ?v2 differ by 1 (adjacent by 1 square)
    (delta2 ?v1 ?v2)             ;; Coordinates ?v1 and ?v2 differ by 2 (adjacent by 2 squares)
  )
  (:action move
    :parameters (?p ?x1 ?y1 ?x2 ?y2)
    :precondition (and
      (at ?p ?x1 ?y1)              ;; The knight is at coordinates ?x1, ?y1
      (not (occupied ?x2 ?y2))     ;; The destination square is not occupied
      (or                          ;; The knight moves in an "L" shape
        (and (delta1 ?x1 ?x2) (delta2 ?y1 ?y2)) ;; Move two squares in y direction, one square in x direction
        (and (delta2 ?x1 ?x2) (delta1 ?y1 ?y2)) ;; Move two squares in x direction, one square in y direction
      )
    )
    :effect (and
      (not (at ?p ?x1 ?y1))        ;; The knight is no longer at the original location
      (at ?p ?x2 ?y2)              ;; The knight is now at the destination location
      (occupied ?x2 ?y2)           ;; The destination square becomes occupied
      (not (occupied ?x1 ?y1))     ;; The starting square becomes unoccupied
    )
  )
)