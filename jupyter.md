- installare pandas e jupyter
```sh
py -m pip install -U pandas jupyterlab
```

- creare e posizionrasi nella directory del progetto

- avviare jupyter (i file saranno salvati nella directory in cui si esegue il comando)
```sh
py -m jupyter notebook
```
  - se l'avvio abortisce con un errore `NotImplementedError` modificare il file `C:\Python38\Lib\site-packages\tornado\platform\asyncio.py` aggiungendo questo frammento dopo le import principali
```py
import sys

if sys.platform == 'win32':
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
```
