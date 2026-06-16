# Istruzioni:

1. Installare Conda: 
   1. https://www.anaconda.com/download/success
   2. `cd Downloads`
   3. `sudo chmod 777 <nome_file>.sh`
   4. `./<nome_file>.sh`
2. Creare un ambiente virtuale, sostituendo <name> con il nome che vuoi assegnare all'ambiente:
   1. `conda create -n <name> python==3.9 pip`
   2. `conda activate <name>`
   3. `pip install -r requirements.txt`
3. Eseguire il clone delle repositories secondarie:
   1. `git submodule update --init --recursive`
4. Installare Fast Downward:
   1. `cd Downward`
   2. `./build.py` (Build del planner)
   3. `./fast-downward.py --help` (Verifica dell'esito dell'installazione)
   4. Comandi di esempio:
      ```bash
        ./fast-downward.py \
            --search "astar(lmcut())" \
            --plan-file <path_del_folder_in_cui_salvare_il_piano>/<nome_file>.txt \
            <file_di_dominio>.pddl \
            <file_di_problema>.pddl
      ```

# Struttura cartella:
```
Files /
├── examples                         # Utilities e file di esempio
│   ├── pdd_files/                   # Folder con un esempio di problema e dominio pddl relativi ad uno scenario AI2THOR
│   ├── scripts/                     # Utilities python
│   │   ├── object_list.py/          # Script python con esempio su come recuperare gli oggetti presenti all'interno del Floor AI2THOR selezionato
├── Downward                         # Directory principale della libreria Fast Downward
├── LaMMA-P                          # Repository di terzi con materiale ausiliario
├── ViLaIn                           # Repository di terzi con materiale ausiliario
│   ├── data/                        # Domain definitions and problem files
│   │   ├── blocksworld/             # Single-agent blocksworld domain
│   │   │   ├── domain.pddl          # Domain description
│   │   │   ├── problems             # Problem files
│   │   │   |   ├── problem*.pddl    # Problem descriptions 
│   │   │   ...
```

# Link Utili:
1. Documentazione del Simulatore: https://ai2thor.allenai.org/ithor/documentation
2. Modelli Ollama:
    - Gemma4: https://ollama.com/library/gemma4 - Vision
    - GPT-OSS: https://ollama.com/library/gpt-oss - Text