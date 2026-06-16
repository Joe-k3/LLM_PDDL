(define (problem move_to_trash_can_problem)
  (:domain robot2)
  (:objects
    robot2 - robot
    garbageCan - object
    floor - object
  )
  (:init
    (at robot2 floor)
    (at-location garbageCan floor)
  )
  (:goal
    (and
      (at robot2 garbageCan)
    )
  )
)