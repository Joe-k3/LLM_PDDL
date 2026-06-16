(define (problem dispose_spatula_problem)
  (:domain robot2)
  (:objects
    robot2 - robot
    spatula - object
    garbageCan - object
  )
  (:init
    (holding robot2 spatula)
    (at robot2 garbageCan)
  )
  (:goal
    (and
      (at-location spatula garbageCan)
      (not (holding robot2 spatula))
    )
  )
)