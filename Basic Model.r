{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "7da5669d",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:12.444736Z",
     "iopub.status.busy": "2023-03-22T15:24:12.442594Z",
     "iopub.status.idle": "2023-03-22T15:24:16.599433Z",
     "shell.execute_reply": "2023-03-22T15:24:16.597629Z"
    },
    "papermill": {
     "duration": 4.16761,
     "end_time": "2023-03-22T15:24:16.601921",
     "exception": false,
     "start_time": "2023-03-22T15:24:12.434311",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n",
      "------------------------------------------------------------------------------\n",
      "\n",
      "You have loaded plyr after dplyr - this is likely to cause problems.\n",
      "If you need functions from both plyr and dplyr, please load plyr first, then dplyr:\n",
      "library(plyr); library(dplyr)\n",
      "\n",
      "------------------------------------------------------------------------------\n",
      "\n",
      "\n",
      "Attaching package: ‘plyr’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    arrange, count, desc, failwith, id, mutate, rename, summarise,\n",
      "    summarize\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    compact\n",
      "\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    lift\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘neuralnet’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    compute\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘CatEncoders’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:base’:\n",
      "\n",
      "    transform\n",
      "\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'spaceship-titanic'"
      ],
      "text/latex": [
       "'spaceship-titanic'"
      ],
      "text/markdown": [
       "'spaceship-titanic'"
      ],
      "text/plain": [
       "[1] \"spaceship-titanic\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(ISLR)\n",
    "library(e1071)\n",
    "library(plyr)\n",
    "library(readr)\n",
    "library(dplyr)\n",
    "library(caret)\n",
    "library(neuralnet)\n",
    "library(nnet)\n",
    "library(CatEncoders)\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c04652d8",
   "metadata": {
    "papermill": {
     "duration": 0.006336,
     "end_time": "2023-03-22T15:24:16.614920",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.608584",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The tutorial I'm gonna work off of:https://seantrott.github.io/binary_classification_R/\n",
    "also:https://www.pluralsight.com/guides/machine-learning-with-neural-networks-r\n",
    "https://visualstudiomagazine.com/Articles/2016/11/01/Using-the-R-nnet-Package.aspx?Page=1\n",
    "https://cran.r-project.org/web/packages/nnet/nnet.pdf"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "316260e0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.659546Z",
     "iopub.status.busy": "2023-03-22T15:24:16.629275Z",
     "iopub.status.idle": "2023-03-22T15:24:16.733551Z",
     "shell.execute_reply": "2023-03-22T15:24:16.731667Z"
    },
    "papermill": {
     "duration": 0.11495,
     "end_time": "2023-03-22T15:24:16.736049",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.621099",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Reading Titanic file to Train_df\n",
    "Train_df <- read.csv('/kaggle/input/spaceship-titanic/train.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "fd9910a8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.751878Z",
     "iopub.status.busy": "2023-03-22T15:24:16.750323Z",
     "iopub.status.idle": "2023-03-22T15:24:16.766303Z",
     "shell.execute_reply": "2023-03-22T15:24:16.764572Z"
    },
    "papermill": {
     "duration": 0.026465,
     "end_time": "2023-03-22T15:24:16.768895",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.742430",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Train_df<-drop_na(Train_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "308d2980",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.784815Z",
     "iopub.status.busy": "2023-03-22T15:24:16.783227Z",
     "iopub.status.idle": "2023-03-22T15:24:16.819666Z",
     "shell.execute_reply": "2023-03-22T15:24:16.817862Z"
    },
    "papermill": {
     "duration": 0.047003,
     "end_time": "2023-03-22T15:24:16.822077",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.775074",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>HomePlanet</th><th scope=col>CryoSleep</th><th scope=col>Cabin</th><th scope=col>Destination</th><th scope=col>Age</th><th scope=col>VIP</th><th scope=col>RoomService</th><th scope=col>FoodCourt</th><th scope=col>ShoppingMall</th><th scope=col>Spa</th><th scope=col>VRDeck</th><th scope=col>Name</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0001_01</td><td>Europa</td><td>False</td><td>B/0/P</td><td>TRAPPIST-1e  </td><td>39</td><td>False</td><td>  0</td><td>   0</td><td>  0</td><td>   0</td><td>  0</td><td>Maham Ofracculy  </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0002_01</td><td>Earth </td><td>False</td><td>F/0/S</td><td>TRAPPIST-1e  </td><td>24</td><td>False</td><td>109</td><td>   9</td><td> 25</td><td> 549</td><td> 44</td><td>Juanna Vines     </td><td>True </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0003_01</td><td>Europa</td><td>False</td><td>A/0/S</td><td>TRAPPIST-1e  </td><td>58</td><td>True </td><td> 43</td><td>3576</td><td>  0</td><td>6715</td><td> 49</td><td>Altark Susent    </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0003_02</td><td>Europa</td><td>False</td><td>A/0/S</td><td>TRAPPIST-1e  </td><td>33</td><td>False</td><td>  0</td><td>1283</td><td>371</td><td>3329</td><td>193</td><td>Solam Susent     </td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0004_01</td><td>Earth </td><td>False</td><td>F/1/S</td><td>TRAPPIST-1e  </td><td>16</td><td>False</td><td>303</td><td>  70</td><td>151</td><td> 565</td><td>  2</td><td>Willy Santantines</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0005_01</td><td>Earth </td><td>False</td><td>F/0/P</td><td>PSO J318.5-22</td><td>44</td><td>False</td><td>  0</td><td> 483</td><td>  0</td><td> 291</td><td>  0</td><td>Sandie Hinetthews</td><td>True </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & PassengerId & HomePlanet & CryoSleep & Cabin & Destination & Age & VIP & RoomService & FoodCourt & ShoppingMall & Spa & VRDeck & Name & Transported\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 0001\\_01 & Europa & False & B/0/P & TRAPPIST-1e   & 39 & False &   0 &    0 &   0 &    0 &   0 & Maham Ofracculy   & False\\\\\n",
       "\t2 & 0002\\_01 & Earth  & False & F/0/S & TRAPPIST-1e   & 24 & False & 109 &    9 &  25 &  549 &  44 & Juanna Vines      & True \\\\\n",
       "\t3 & 0003\\_01 & Europa & False & A/0/S & TRAPPIST-1e   & 58 & True  &  43 & 3576 &   0 & 6715 &  49 & Altark Susent     & False\\\\\n",
       "\t4 & 0003\\_02 & Europa & False & A/0/S & TRAPPIST-1e   & 33 & False &   0 & 1283 & 371 & 3329 & 193 & Solam Susent      & False\\\\\n",
       "\t5 & 0004\\_01 & Earth  & False & F/1/S & TRAPPIST-1e   & 16 & False & 303 &   70 & 151 &  565 &   2 & Willy Santantines & True \\\\\n",
       "\t6 & 0005\\_01 & Earth  & False & F/0/P & PSO J318.5-22 & 44 & False &   0 &  483 &   0 &  291 &   0 & Sandie Hinetthews & True \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 14\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | HomePlanet &lt;chr&gt; | CryoSleep &lt;chr&gt; | Cabin &lt;chr&gt; | Destination &lt;chr&gt; | Age &lt;dbl&gt; | VIP &lt;chr&gt; | RoomService &lt;dbl&gt; | FoodCourt &lt;dbl&gt; | ShoppingMall &lt;dbl&gt; | Spa &lt;dbl&gt; | VRDeck &lt;dbl&gt; | Name &lt;chr&gt; | Transported &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0001_01 | Europa | False | B/0/P | TRAPPIST-1e   | 39 | False |   0 |    0 |   0 |    0 |   0 | Maham Ofracculy   | False |\n",
       "| 2 | 0002_01 | Earth  | False | F/0/S | TRAPPIST-1e   | 24 | False | 109 |    9 |  25 |  549 |  44 | Juanna Vines      | True  |\n",
       "| 3 | 0003_01 | Europa | False | A/0/S | TRAPPIST-1e   | 58 | True  |  43 | 3576 |   0 | 6715 |  49 | Altark Susent     | False |\n",
       "| 4 | 0003_02 | Europa | False | A/0/S | TRAPPIST-1e   | 33 | False |   0 | 1283 | 371 | 3329 | 193 | Solam Susent      | False |\n",
       "| 5 | 0004_01 | Earth  | False | F/1/S | TRAPPIST-1e   | 16 | False | 303 |   70 | 151 |  565 |   2 | Willy Santantines | True  |\n",
       "| 6 | 0005_01 | Earth  | False | F/0/P | PSO J318.5-22 | 44 | False |   0 |  483 |   0 |  291 |   0 | Sandie Hinetthews | True  |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId HomePlanet CryoSleep Cabin Destination   Age VIP   RoomService\n",
       "1 0001_01     Europa     False     B/0/P TRAPPIST-1e   39  False   0        \n",
       "2 0002_01     Earth      False     F/0/S TRAPPIST-1e   24  False 109        \n",
       "3 0003_01     Europa     False     A/0/S TRAPPIST-1e   58  True   43        \n",
       "4 0003_02     Europa     False     A/0/S TRAPPIST-1e   33  False   0        \n",
       "5 0004_01     Earth      False     F/1/S TRAPPIST-1e   16  False 303        \n",
       "6 0005_01     Earth      False     F/0/P PSO J318.5-22 44  False   0        \n",
       "  FoodCourt ShoppingMall Spa  VRDeck Name              Transported\n",
       "1    0        0             0   0    Maham Ofracculy   False      \n",
       "2    9       25           549  44    Juanna Vines      True       \n",
       "3 3576        0          6715  49    Altark Susent     False      \n",
       "4 1283      371          3329 193    Solam Susent      False      \n",
       "5   70      151           565   2    Willy Santantines True       \n",
       "6  483        0           291   0    Sandie Hinetthews True       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(Train_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "f6428594",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.838346Z",
     "iopub.status.busy": "2023-03-22T15:24:16.836769Z",
     "iopub.status.idle": "2023-03-22T15:24:16.853937Z",
     "shell.execute_reply": "2023-03-22T15:24:16.852229Z"
    },
    "papermill": {
     "duration": 0.027853,
     "end_time": "2023-03-22T15:24:16.856386",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.828533",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7620"
      ],
      "text/latex": [
       "7620"
      ],
      "text/markdown": [
       "7620"
      ],
      "text/plain": [
       "[1] 7620"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(Train_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "b8297037",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.873478Z",
     "iopub.status.busy": "2023-03-22T15:24:16.871831Z",
     "iopub.status.idle": "2023-03-22T15:24:16.890362Z",
     "shell.execute_reply": "2023-03-22T15:24:16.888524Z"
    },
    "papermill": {
     "duration": 0.030394,
     "end_time": "2023-03-22T15:24:16.893496",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.863102",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Eliminate columns that won't be usefull\n",
    "Train_df <- subset(Train_df, select = -c(PassengerId, Name) )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "9fc4aae0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.911411Z",
     "iopub.status.busy": "2023-03-22T15:24:16.909809Z",
     "iopub.status.idle": "2023-03-22T15:24:16.923578Z",
     "shell.execute_reply": "2023-03-22T15:24:16.921859Z"
    },
    "papermill": {
     "duration": 0.02671,
     "end_time": "2023-03-22T15:24:16.926791",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.900081",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Train_df$CryoSleep <- as.numeric(factor(Train_df$CryoSleep))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "23531d6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:16.943765Z",
     "iopub.status.busy": "2023-03-22T15:24:16.942188Z",
     "iopub.status.idle": "2023-03-22T15:24:16.994319Z",
     "shell.execute_reply": "2023-03-22T15:24:16.992488Z"
    },
    "papermill": {
     "duration": 0.064019,
     "end_time": "2023-03-22T15:24:16.997346",
     "exception": false,
     "start_time": "2023-03-22T15:24:16.933327",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Loop through each column in the dataset\n",
    "for (i in 1:ncol(Train_df)) {\n",
    "  # Check if the column is a factor or character type\n",
    "  if (is.factor(Train_df[,i]) || is.character(Train_df[,i])) {\n",
    "    # Use the factor() function to label encode the column\n",
    "    Train_df[,i] <- as.numeric(factor(Train_df[,i]))\n",
    "  }\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "1bf17a44",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.014380Z",
     "iopub.status.busy": "2023-03-22T15:24:17.012719Z",
     "iopub.status.idle": "2023-03-22T15:24:17.046480Z",
     "shell.execute_reply": "2023-03-22T15:24:17.044191Z"
    },
    "papermill": {
     "duration": 0.045462,
     "end_time": "2023-03-22T15:24:17.049515",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.004053",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>HomePlanet</th><th scope=col>CryoSleep</th><th scope=col>Cabin</th><th scope=col>Destination</th><th scope=col>Age</th><th scope=col>VIP</th><th scope=col>RoomService</th><th scope=col>FoodCourt</th><th scope=col>ShoppingMall</th><th scope=col>Spa</th><th scope=col>VRDeck</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>3</td><td>2</td><td> 144</td><td>4</td><td>39</td><td>2</td><td>  0</td><td>   0</td><td>  0</td><td>   0</td><td>  0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>2</td><td>1985</td><td>4</td><td>24</td><td>2</td><td>109</td><td>   9</td><td> 25</td><td> 549</td><td> 44</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>2</td><td>   3</td><td>4</td><td>58</td><td>3</td><td> 43</td><td>3576</td><td>  0</td><td>6715</td><td> 49</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>3</td><td>2</td><td>   3</td><td>4</td><td>33</td><td>2</td><td>  0</td><td>1283</td><td>371</td><td>3329</td><td>193</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2</td><td>2</td><td>1987</td><td>4</td><td>16</td><td>2</td><td>303</td><td>  70</td><td>151</td><td> 565</td><td>  2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>2</td><td>2</td><td>1984</td><td>3</td><td>44</td><td>2</td><td>  0</td><td> 483</td><td>  0</td><td> 291</td><td>  0</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & HomePlanet & CryoSleep & Cabin & Destination & Age & VIP & RoomService & FoodCourt & ShoppingMall & Spa & VRDeck & Transported\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 3 & 2 &  144 & 4 & 39 & 2 &   0 &    0 &   0 &    0 &   0 & 1\\\\\n",
       "\t2 & 2 & 2 & 1985 & 4 & 24 & 2 & 109 &    9 &  25 &  549 &  44 & 2\\\\\n",
       "\t3 & 3 & 2 &    3 & 4 & 58 & 3 &  43 & 3576 &   0 & 6715 &  49 & 1\\\\\n",
       "\t4 & 3 & 2 &    3 & 4 & 33 & 2 &   0 & 1283 & 371 & 3329 & 193 & 1\\\\\n",
       "\t5 & 2 & 2 & 1987 & 4 & 16 & 2 & 303 &   70 & 151 &  565 &   2 & 2\\\\\n",
       "\t6 & 2 & 2 & 1984 & 3 & 44 & 2 &   0 &  483 &   0 &  291 &   0 & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 12\n",
       "\n",
       "| <!--/--> | HomePlanet &lt;dbl&gt; | CryoSleep &lt;dbl&gt; | Cabin &lt;dbl&gt; | Destination &lt;dbl&gt; | Age &lt;dbl&gt; | VIP &lt;dbl&gt; | RoomService &lt;dbl&gt; | FoodCourt &lt;dbl&gt; | ShoppingMall &lt;dbl&gt; | Spa &lt;dbl&gt; | VRDeck &lt;dbl&gt; | Transported &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 3 | 2 |  144 | 4 | 39 | 2 |   0 |    0 |   0 |    0 |   0 | 1 |\n",
       "| 2 | 2 | 2 | 1985 | 4 | 24 | 2 | 109 |    9 |  25 |  549 |  44 | 2 |\n",
       "| 3 | 3 | 2 |    3 | 4 | 58 | 3 |  43 | 3576 |   0 | 6715 |  49 | 1 |\n",
       "| 4 | 3 | 2 |    3 | 4 | 33 | 2 |   0 | 1283 | 371 | 3329 | 193 | 1 |\n",
       "| 5 | 2 | 2 | 1987 | 4 | 16 | 2 | 303 |   70 | 151 |  565 |   2 | 2 |\n",
       "| 6 | 2 | 2 | 1984 | 3 | 44 | 2 |   0 |  483 |   0 |  291 |   0 | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  HomePlanet CryoSleep Cabin Destination Age VIP RoomService FoodCourt\n",
       "1 3          2          144  4           39  2     0            0     \n",
       "2 2          2         1985  4           24  2   109            9     \n",
       "3 3          2            3  4           58  3    43         3576     \n",
       "4 3          2            3  4           33  2     0         1283     \n",
       "5 2          2         1987  4           16  2   303           70     \n",
       "6 2          2         1984  3           44  2     0          483     \n",
       "  ShoppingMall Spa  VRDeck Transported\n",
       "1   0             0   0    1          \n",
       "2  25           549  44    2          \n",
       "3   0          6715  49    1          \n",
       "4 371          3329 193    1          \n",
       "5 151           565   2    2          \n",
       "6   0           291   0    2          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(Train_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "8e3d1ee8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.066810Z",
     "iopub.status.busy": "2023-03-22T15:24:17.065183Z",
     "iopub.status.idle": "2023-03-22T15:24:17.451370Z",
     "shell.execute_reply": "2023-03-22T15:24:17.449288Z"
    },
    "papermill": {
     "duration": 0.39834,
     "end_time": "2023-03-22T15:24:17.454640",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.056300",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "# weights:  27\n",
      "initial  value 35499.157888 \n",
      "iter  10 value 1912.309559\n",
      "iter  20 value 1891.282426\n",
      "iter  30 value 1880.997563\n",
      "iter  40 value 1867.422825\n",
      "iter  50 value 1529.352672\n",
      "iter  60 value 1500.357581\n",
      "iter  70 value 1420.427028\n",
      "iter  80 value 1410.397780\n",
      "iter  90 value 1406.367145\n",
      "iter 100 value 1396.890909\n",
      "final  value 1396.890909 \n",
      "stopped after 100 iterations\n"
     ]
    }
   ],
   "source": [
    "# create and train nn\n",
    "nnet_model <- nnet(Transported ~ ., data=Train_df, size=2, linout=T, MaxNWts=100000)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "36e61368",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.473960Z",
     "iopub.status.busy": "2023-03-22T15:24:17.472357Z",
     "iopub.status.idle": "2023-03-22T15:24:17.533252Z",
     "shell.execute_reply": "2023-03-22T15:24:17.531446Z"
    },
    "papermill": {
     "duration": 0.073051,
     "end_time": "2023-03-22T15:24:17.535684",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.462633",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Test_df <- read.csv('/kaggle/input/spaceship-titanic/test.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "5f8e4865",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.553355Z",
     "iopub.status.busy": "2023-03-22T15:24:17.551714Z",
     "iopub.status.idle": "2023-03-22T15:24:17.566548Z",
     "shell.execute_reply": "2023-03-22T15:24:17.564822Z"
    },
    "papermill": {
     "duration": 0.026238,
     "end_time": "2023-03-22T15:24:17.568948",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.542710",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Test_df <- subset(Test_df, select = -c(PassengerId, Name) )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "7ea93000",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.586492Z",
     "iopub.status.busy": "2023-03-22T15:24:17.584909Z",
     "iopub.status.idle": "2023-03-22T15:24:17.625075Z",
     "shell.execute_reply": "2023-03-22T15:24:17.622533Z"
    },
    "papermill": {
     "duration": 0.052595,
     "end_time": "2023-03-22T15:24:17.628611",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.576016",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "for (i in 1:ncol(Test_df)-1) {\n",
    "  # Check if the column is a factor or character type\n",
    "  if (is.factor(Test_df[,i]) || is.character(Test_df[,i])) {\n",
    "    # Use the factor() function to label encode the column\n",
    "    Test_df[,i] <- as.numeric(factor(Test_df[,i]))\n",
    "  }\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "19d2751e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.648107Z",
     "iopub.status.busy": "2023-03-22T15:24:17.645615Z",
     "iopub.status.idle": "2023-03-22T15:24:17.683439Z",
     "shell.execute_reply": "2023-03-22T15:24:17.680522Z"
    },
    "papermill": {
     "duration": 0.051175,
     "end_time": "2023-03-22T15:24:17.686735",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.635560",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Use the trained neural network to predict outcomes\n",
    "predicted_outcomes <- predict(nnet_model, Test_df)\n",
    "\n",
    "# Create a new dataframe to store the predicted outcomes\n",
    "predicted_df <- data.frame(predicted_outcomes)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "15ec3138",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.704696Z",
     "iopub.status.busy": "2023-03-22T15:24:17.703040Z",
     "iopub.status.idle": "2023-03-22T15:24:17.758695Z",
     "shell.execute_reply": "2023-03-22T15:24:17.755741Z"
    },
    "papermill": {
     "duration": 0.069841,
     "end_time": "2023-03-22T15:24:17.763900",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.694059",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Test_df <- read.csv('/kaggle/input/spaceship-titanic/test.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "27ed712a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.786905Z",
     "iopub.status.busy": "2023-03-22T15:24:17.784474Z",
     "iopub.status.idle": "2023-03-22T15:24:17.807336Z",
     "shell.execute_reply": "2023-03-22T15:24:17.804489Z"
    },
    "papermill": {
     "duration": 0.037475,
     "end_time": "2023-03-22T15:24:17.810646",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.773171",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "final_df <- cbind(Test_df$PassengerId, predicted_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "63e57cd4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.833681Z",
     "iopub.status.busy": "2023-03-22T15:24:17.831137Z",
     "iopub.status.idle": "2023-03-22T15:24:17.853631Z",
     "shell.execute_reply": "2023-03-22T15:24:17.849309Z"
    },
    "papermill": {
     "duration": 0.036221,
     "end_time": "2023-03-22T15:24:17.857186",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.820965",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "colnames(final_df) <- c(\"PassengerId\",\"Transported\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "97dc006d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:17.877165Z",
     "iopub.status.busy": "2023-03-22T15:24:17.875562Z",
     "iopub.status.idle": "2023-03-22T15:24:18.235934Z",
     "shell.execute_reply": "2023-03-22T15:24:18.233772Z"
    },
    "papermill": {
     "duration": 0.374784,
     "end_time": "2023-03-22T15:24:18.239500",
     "exception": false,
     "start_time": "2023-03-22T15:24:17.864716",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "for(i in 1:nrow(final_df)){\n",
    "    if (is.na(final_df[i,2])){\n",
    "        final_df[i,2]<- \"False\"\n",
    "    }else if (final_df[i,2]>1.5){\n",
    "        final_df[i,2]<- \"True\"\n",
    "    } else{\n",
    "        final_df[i,2] <- \"False\"\n",
    "    }\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "cf0c8a99",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:18.257753Z",
     "iopub.status.busy": "2023-03-22T15:24:18.256055Z",
     "iopub.status.idle": "2023-03-22T15:24:18.283827Z",
     "shell.execute_reply": "2023-03-22T15:24:18.281489Z"
    },
    "papermill": {
     "duration": 0.040058,
     "end_time": "2023-03-22T15:24:18.286898",
     "exception": false,
     "start_time": "2023-03-22T15:24:18.246840",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Transported</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0013_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0018_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0019_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0021_01</td><td>False</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0023_01</td><td>True </td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0027_01</td><td>False</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & PassengerId & Transported\\\\\n",
       "  & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 0013\\_01 & True \\\\\n",
       "\t2 & 0018\\_01 & False\\\\\n",
       "\t3 & 0019\\_01 & True \\\\\n",
       "\t4 & 0021\\_01 & False\\\\\n",
       "\t5 & 0023\\_01 & True \\\\\n",
       "\t6 & 0027\\_01 & False\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | PassengerId &lt;chr&gt; | Transported &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | 0013_01 | True  |\n",
       "| 2 | 0018_01 | False |\n",
       "| 3 | 0019_01 | True  |\n",
       "| 4 | 0021_01 | False |\n",
       "| 5 | 0023_01 | True  |\n",
       "| 6 | 0027_01 | False |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId Transported\n",
       "1 0013_01     True       \n",
       "2 0018_01     False      \n",
       "3 0019_01     True       \n",
       "4 0021_01     False      \n",
       "5 0023_01     True       \n",
       "6 0027_01     False      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(final_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "e219a4bc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-22T15:24:18.305315Z",
     "iopub.status.busy": "2023-03-22T15:24:18.303633Z",
     "iopub.status.idle": "2023-03-22T15:24:18.323818Z",
     "shell.execute_reply": "2023-03-22T15:24:18.321907Z"
    },
    "papermill": {
     "duration": 0.032771,
     "end_time": "2023-03-22T15:24:18.326934",
     "exception": false,
     "start_time": "2023-03-22T15:24:18.294163",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Write CSV\n",
    "write.csv(final_df, file = \"/kaggle/working/my_data.csv\", row.names = FALSE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "3c18f3d3",
   "metadata": {
    "papermill": {
     "duration": 0.00729,
     "end_time": "2023-03-22T15:24:18.341789",
     "exception": false,
     "start_time": "2023-03-22T15:24:18.334499",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "9f48b4db",
   "metadata": {
    "papermill": {
     "duration": 0.007339,
     "end_time": "2023-03-22T15:24:18.356512",
     "exception": false,
     "start_time": "2023-03-22T15:24:18.349173",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "52cbfa9f",
   "metadata": {
    "papermill": {
     "duration": 0.007353,
     "end_time": "2023-03-22T15:24:18.371186",
     "exception": false,
     "start_time": "2023-03-22T15:24:18.363833",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 9.957563,
   "end_time": "2023-03-22T15:24:18.501164",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-22T15:24:08.543601",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
