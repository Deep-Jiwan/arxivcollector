[![Python 3.8](https://img.shields.io/badge/python-3.8-blue.svg)](https://www.python.org/downloads/release/python-360/)
[![Python 3.9](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/downloads/release/python-360/)
[![Python 3.10](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/downloads/release/python-360/)
[![Python 3.11](https://img.shields.io/badge/python-3.11-blue.svg)](https://www.python.org/downloads/release/python-360/)

arXivCollector
======

**arXivCollector** allows you to export your arXiv searches as neatly formatted BibTex files for easy importation in most common scientific reference managers (like Zotero or EndNote), by scraping the web. It does not require prior programming knowledge to use. A particularly useful feature is the inclusion of DOIs and direct links to article PDFs in the resulting file. The references can also be saved as a csv file.

Installation
------

### Option A — Python (local)

1. Have Python installed (download it from [here](https://www.python.org/downloads/)).
2. Clone the repository by running the following command in a terminal:
```bash
git clone https://github.com/Deep-Jiwan/arxivcollector.git
```
3. Navigate to the cloned repository:
```bash
cd path/to/arxivcollector
```

4. Probably: create a virtual environment
```bash
python -m venv venv
source venv/bin/activate
```

5. Install requirements:
```bash
pip install -r requirements.txt
```

### Option B — Docker

Pull the pre-built image from the GitHub Container Registry:

```bash
docker pull ghcr.io/deep-jiwan/arxivcollector:latest
```

Getting started
------

**arXivCollector** can be used in three ways:
- By importing the `ArXivCollector()` class;
- By executing the `arxivcollector.py` script from the command line; or
- By running the Docker image directly as a command-line tool.

### Step 1: obtain an arXiv search results URL 
To obtain an arXiv search results URL for your search query, go to [https://arxiv.org/](https://arxiv.org/) or to the [advanced search page](https://arxiv.org/search/advanced) and construct your search query. Press the big blue button that says "Search", wait until you arrive on the page that displays the search results. Now copy the entire URL as is, and you're done ✅. 

### Step 2: use ArXivCollector in one of three ways
#### In Python
Run the following Python code (e.g., in a script or from a Jupyter notebook). 

```python
from arxivcollector import ArXivCollector

# Initiate a new instance of the arXivCollector class
collector = ArXivCollector()
# Set the title and type of the exported file
collector.set_title("Parrots")
collector.set_mode("csv")
# Pass the search URL to the run method
collector.run('https://arxiv.org/search/advanced?advanced=&terms-0-operator=AND&terms-0-term=stochastic+parrot&terms-0-field=title&classification-physics_archives=all&classification-include_cross_list=include&date-filter_by=all_dates&date-year=&date-from_date=&date-to_date=&date-date_type=submitted_date&abstracts=show&size=50&order=-announced_date_first')
```

After running this with your own search URL and title, a new file should appear in the current working directory.

#### From the commandline
The three positional arguments after `arxivcollector.py` are the search URL, the output filename stem, and the file type (`csv` or `bibtex`).

```bash
python arxivcollector.py "https://arxiv.org/search/advanced?advanced=&terms-0-operator=AND&terms-0-term=stochastic+parrot&terms-0-field=title&classification-physics_archives=all&classification-include_cross_list=include&date-filter_by=all_dates&date-year=&date-from_date=&date-to_date=&date-date_type=submitted_date&abstracts=show&size=50&order=-announced_date_first" "output" "csv"
```

#### With Docker

The Docker image is published to `ghcr.io/deep-jiwan/arxivcollector`. It accepts the same three positional arguments as the script. Mount your current directory to `/data` inside the container — the exported file will be written there and appear in the directory you ran the command from.

```
docker run --rm -v <current-dir>:/data ghcr.io/deep-jiwan/arxivcollector:latest URL TITLE MODE
```

| Argument | Description | Example |
|---|---|---|
| `URL` | arXiv search results URL | `"https://arxiv.org/search/..."` |
| `TITLE` | Output filename without extension | `"parrots"` |
| `MODE` | Output format: `bibtex` or `csv` | `bibtex` |

The exported file (`parrots.bib` for `bibtex`, `parrots.csv` for `csv`) will appear in the directory from which you ran the command.

---

**Bash / Zsh (Linux & macOS)**

```bash
docker run --rm \
  -v "$(pwd):/data" \
  ghcr.io/deep-jiwan/arxivcollector:latest \
  "https://arxiv.org/search/advanced?advanced=&terms-0-operator=AND&terms-0-term=stochastic+parrot&terms-0-field=title&classification-physics_archives=all&classification-include_cross_list=include&date-filter_by=all_dates&date-year=&date-from_date=&date-to_date=&date-date_type=submitted_date&abstracts=show&size=50&order=-announced_date_first" \
  "parrots" \
  "bibtex"
```

---

**PowerShell (Windows)**

```powershell
docker run --rm `
  -v "${PWD}:/data" `
  ghcr.io/deep-jiwan/arxivcollector:latest `
  "https://arxiv.org/search/advanced?advanced=&terms-0-operator=AND&terms-0-term=stochastic+parrot&terms-0-field=title&classification-physics_archives=all&classification-include_cross_list=include&date-filter_by=all_dates&date-year=&date-from_date=&date-to_date=&date-date_type=submitted_date&abstracts=show&size=50&order=-announced_date_first" `
  "parrots" `
  "bibtex"
```

---

**Command Prompt (Windows CMD)**

```cmd
docker run --rm ^
  -v "%cd%:/data" ^
  ghcr.io/deep-jiwan/arxivcollector:latest ^
  "https://arxiv.org/search/advanced?advanced=&terms-0-operator=AND&terms-0-term=stochastic+parrot&terms-0-field=title&classification-physics_archives=all&classification-include_cross_list=include&date-filter_by=all_dates&date-year=&date-from_date=&date-to_date=&date-date_type=submitted_date&abstracts=show&size=50&order=-announced_date_first" ^
  "parrots" ^
  "bibtex"
```

---

In all cases the exported file (`parrots.bib` for `bibtex` mode, `parrots.csv` for `csv` mode) will be written to the directory from which you ran the command.

Special thanks
------
Fatima et al. served as the main inspiration for this code. To see their paper, go to: https://doi.org/10.1016/j.infsof.2023.107251. 

Full reference:
```
Fatima, R., Yasin, A., Liu, L., Wang, J., & Afzal, W. (2023). Retrieving arXiv, SocArXiv, and SSRN metadata for initial review screening. Information and Software Technology, 161, 107251. https://doi.org/10.1016/j.infsof.2023.107251
```

API
------

### Class: ArXivCollector

This class is used to collect metadata from the arXiv website and save it in either BibTeX or CSV format.

#### `__init__(self, user_agent, num_abstracts, arxiv_doi_prefix, default_item_type, verbose, mode) -> None`

Initializes an instance of the ArXiv class.

##### Parameters:

- `user_agent` (str): The User-Agent header to use when sending requests. Default is a common User-Agent string for a Chrome browser.
- `num_abstracts` (int): The number of abstracts you want displayed per page (on the arXiv website). Default is 50.
- `arxiv_doi_prefix` (str): The prefix for the DOI of arXiv papers. Default is "https://doi.org/10.48550".
- `default_item_type` (str): The default item type for the BibTeX entries. Default is "ARTICLE".
- `verbose` (bool): Whether to print verbose output. Default is False.
- `mode` (str): The mode to use when saving the collected data. Can be either "bibtex" or "csv". Default is "bibtex".

#### `set_title(self, title: str)`

Sets the title of the output file.

#### `set_mode(self, mode: str)`

Sets the type of the output file.

##### Parameters:

- `title` (str): The title to set.
- `mode` (str): The type of file to set.

#### `run(self, url)`

Starts the collection process for the specified URL.

##### Parameters:

- `url` (str): The URL to start the collection process for.
