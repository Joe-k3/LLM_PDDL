(define (problem locate_pickup_spatula_problem)
  (:domain robot2)
  (:objects
    robot2 - robot
    spatula - object
    counterTop - object
  )
  (:init
    (at robot2 counterTop)
    (at-location spatula counterTop)
    ;; Removed (inaction robot2) as it contradicts action preconditions
  )
  (:goal
    (and
      (holding robot2 spatula)
    )
  )
)