# PDDL to AI2-THOR Python Prompt

Source: `materiale/LaMMA-P/scripts/plantocode.py`, `MimicFormatTranslator.create_few_shot_prompt`.

This is the prompt template used to translate a complete PDDL plan into executable Python code for the AI2-THOR controller. For GPT chat models, the script sends one system message and one user message. The placeholders `{task_description}` and `{combined_plan}` are filled at runtime.

## System Message

```text
You are a Robot PDDL to Mimic Format Translator. Your task is to translate complete PDDL plans into executable Python code following the AI2-THOR controller format. Translate the entire plan as a single coherent function.
```

## User Message Template

```text
# CRITICAL INSTRUCTION: DO NOT REDEFINE AI2-THOR FUNCTIONS
# The following AI2-THOR functions are ALREADY DEFINED and available:
# - GoToObject(robot, object_name)
# - PickupObject(robot, object_name) 
# - PutObject(robot, object_name, target_location)
# - SwitchOn(robot, object_name)
# - SwitchOff(robot, object_name)
# - time.sleep(seconds)
# 
# DO NOT create new function definitions for these. Use them directly as shown in the template.
# DO NOT add "def GoToObject(...):" or similar definitions.

# Example: Complete PDDL Plan Translation with Multi-Robot Coordination
Task: Wash multiple vegetables (apple, tomato, lettuce, potato)
Complete PDDL Plan: (define (problem wash_vegetables) (:domain robot_domain) (:objects apple tomato lettuce potato sink faucet counter) (:init (at apple counter) (at tomato counter) (at lettuce counter) (at potato counter)) (:goal (and (washed apple) (washed tomato) (washed lettuce) (washed potato))))

# IMPORTANT: Follow this EXACT structure for AI2-THOR execution
# NOTE: AI2-THOR functions are already imported and available - DO NOT redefine them

def wash_apple(robots):
    # 0: Task: Wash the Apple
    # 1: Go to the Apple.
    GoToObject(robots[0], 'Apple')
    # 2: Pick up the Apple.
    PickupObject(robots[0], 'Apple')
    # 3: Go to the Sink.
    GoToObject(robots[0], 'Sink')
    # 4: Put the Apple in the Sink.
    PutObject(robots[0], 'Apple', 'Sink')
    # 5: Switch on the Faucet.
    SwitchOn(robots[0], 'Faucet')
    # 6: Wait for a while to let the Apple wash.
    time.sleep(5)
    # 7: Switch off the Faucet.
    SwitchOff(robots[0], 'Faucet')
    # 8: Pick up the washed Apple.
    PickupObject(robots[0], 'Apple')
    # 9: Go to the CounterTop.
    GoToObject(robots[0], 'CounterTop')
    # 10: Put the washed Apple on the CounterTop.
    PutObject(robots[0], 'Apple', 'CounterTop')

def wash_tomato(robots):
    # 0: Task: Wash the Tomato
    # 1: Go to the Tomato.
    GoToObject(robots[1], 'Tomato')
    # 2: Pick up the Tomato.
    PickupObject(robots[1], 'Tomato')
    # 3: Go to the Sink.
    GoToObject(robots[1], 'Sink')
    # 4: Put the Tomato in the Sink.
    PutObject(robots[1], 'Tomato', 'Sink')
    # 5: Switch on the Faucet.
    SwitchOn(robots[1], 'Faucet')
    # 6: Wait for a while to let the Tomato wash.
    time.sleep(5)
    # 7: Switch off the Faucet.
    SwitchOff(robots[1], 'Faucet')
    # 8: Pick up the washed Tomato.
    PickupObject(robots[1], 'Tomato')
    # 9: Go to the CounterTop.
    GoToObject(robots[1], 'CounterTop')
    # 10: Put the washed Tomato on the CounterTop.
    PutObject(robots[1], 'Tomato', 'CounterTop')

def wash_lettuce(robots):
    # 0: Task: Wash the Lettuce
    # 1: Go to the Lettuce.
    GoToObject(robots[0], 'Lettuce')
    # 2: Pick up the Lettuce.
    PickupObject(robots[0], 'Lettuce')
    # 3: Go to the Sink.
    GoToObject(robots[0], 'Sink')
    # 4: Put the Lettuce in the Sink.
    PutObject(robots[0], 'Lettuce', 'Sink')
    # 5: Switch on the Faucet.
    SwitchOn(robots[0], 'Faucet')
    # 6: Wait for a while to let the Lettuce wash.
    time.sleep(5)
    # 7: Switch off the Faucet.
    SwitchOff(robots[0], 'Faucet')
    # 8: Pick up the washed Lettuce.
    PickupObject(robots[0], 'Lettuce')
    # 9: Go to the CounterTop.
    GoToObject(robots[0], 'CounterTop')
    # 10: Put the washed Lettuce on the CounterTop.
    PutObject(robots[0], 'Lettuce', 'CounterTop')

def wash_potato(robots):
    # 0: Task: Wash the Potato
    # 1: Go to the Potato.
    GoToObject(robots[1], 'Potato')
    # 2: Pick up the Potato.
    PickupObject(robots[1], 'Potato')
    # 3: Go to the Sink.
    GoToObject(robots[1], 'Sink')
    # 4: Put the Potato in the Sink.
    PutObject(robots[1], 'Potato', 'Sink')
    # 5: Switch on the Faucet.
    SwitchOn(robots[1], 'Faucet')
    # 6: Wait for a while to let the Potato wash.
    time.sleep(5)
    # 7: Switch off the Faucet.
    SwitchOff(robots[1], 'Faucet')
    # 8: Pick up the washed Potato.
    PickupObject(robots[1], 'Potato')
    # 9: Go to the CounterTop.
    GoToObject(robots[1], 'CounterTop')
    # 10: Put the washed Potato on the CounterTop.
    PutObject(robots[1], 'Potato', 'CounterTop')

# CRITICAL: Robot task allocation and threading structure
# Assign tasks to robots based on their skills
# Parallelize all tasks
# Assign Task1 to robot1 since it has all the skills to perform actions in Task 1
task1_thread = threading.Thread(target=wash_apple, args=(robots,))
# Assign Task2 to robot2 since it has all the skills to perform actions in Task 2
task2_thread = threading.Thread(target=wash_tomato, args=(robots,))

# Start executing Task 1 and Task 2 in parallel
task1_thread.start()
task2_thread.start()

# Wait for both Task 1 and Task 2 to finish
task1_thread.join()
task2_thread.join()

# Assign Task3 to robot1 since it has all the skills to perform actions in Task 3
task3_thread = threading.Thread(target=wash_lettuce, args=(robots,))
# Assign Task4 to robot2 since it has all the skills to perform actions in Task 4
task4_thread = threading.Thread(target=wash_potato, args=(robots,))

# Start executing Task 3 and Task 4 in parallel
task3_thread.start()
task4_thread.start()

# Wait for both Task 3 and Task 4 to finish
task3_thread.join()
task4_thread.join()

# Task wash_apple, wash_tomato, wash_lettuce, wash_potato is done
action_queue.append({'action':'Done'})
action_queue.append({'action':'Done'})
action_queue.append({'action':'Done'})

task_over = True
time.sleep(5)

# Now translate the following complete plan:
Task: {task_description}
Complete PDDL Plan: {combined_plan}

# IMPORTANT: Generate code that follows the EXACT structure above
def execute_task():
    # Complete plan execution for: {task_description}
```
