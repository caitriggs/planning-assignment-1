(define (problem single-king-problem)
  (:domain king)

  ;; Define objects
  (:objects
    king                         ;; The king piece
    x1 x2 x3 x4 x5 x6 x7         ;; x-coordinates (1 to 7)
    y1 y2 y3 y4 y5 y6 y7 y8      ;; y-coordinates (1 to 8)
  )

  ;; Define the initial state
  (:init
    (at king x1 y1)              ;; The king starts at (1, 1)
    
    ;; Mark the adjacent x- and y-coordinates
    (adjacent x1 x2) (adjacent x2 x1)
    (adjacent x2 x3) (adjacent x3 x2)
    (adjacent x3 x4) (adjacent x4 x3)
    (adjacent x4 x5) (adjacent x5 x4)
    (adjacent x5 x6) (adjacent x6 x5)
    (adjacent x6 x7) (adjacent x7 x6)

    (adjacent y1 y2) (adjacent y2 y1)
    (adjacent y2 y3) (adjacent y3 y2)
    (adjacent y3 y4) (adjacent y4 y3)
    (adjacent y4 y5) (adjacent y5 y4)
    (adjacent y5 y6) (adjacent y6 y5)
    (adjacent y6 y7) (adjacent y7 y6)
    (adjacent y7 y8) (adjacent y8 y7)

    ;; Mark specific squares as occupied
    (occupied x7 y7)
    (occupied x6 y7)
  )

  ;; Define the goal
  (:goal
    (at king x7 y8)              ;; The king must reach (7, 8)
  )
)
