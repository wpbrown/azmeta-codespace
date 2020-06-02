# azmeta-codespace

Setup a pre-configured [Codespace](https://visualstudio.microsoft.com/services/visual-studio-codespaces/) for Azure metadata analysis.

The Docker container for this Codespace is based on Ubuntu 20.04 with the following software pre-installed:
* [buildpack-deps](https://hub.docker.com/_/buildpack-deps/): Git, Curl, GCC
* Python 3.8
* Node.js 12

In the Codespace the following is installed for the `codespace` user:

* Pipx
* Virtualenv
* Virtualenvwrapper
* Jupyter Lab
  * Plotly Widgets

A Visual Studio Code workspace and a corresponding virtualenv called `myproject` is created in `$HOME/workspace/myproject`. It is recommended to switch to this workspace and clone your azmeta-based code and notebooks from Git to there.

The `myproject` virtualenv has some typicaly libraries for Azure metadata analysis pre-installed:

* azmeta
* azmeta-notebook
* azmeta-dataflow
* dagster
* jupyter (to support editing notebooks in Visual Studio Code)
* kqlmagic
* matplotlib
* pandas
* papermill
* openpyxl

`sudo` is enabled for the `codespace` user and the default password is `codespace`.

# Deploy

1. [Create](https://docs.microsoft.com/en-us/visualstudio/online/how-to/browser#create-a-plan) a Codespaces plan.

2. [Deploy](https://online.visualstudio.com/environments/new?name=azmeta&repo=wpbrown/azmeta-codespace) an instance of this Codespace.

   ![Screenshot of the Codespace creation dialog.](./docs/images/create.png)

   Git Repository: `wpbrown/azmeta-codespace` 

3. Wait for setup of your Codespace to complete.

   ![Screenshot of the creation log in complete state.](./docs/images/created.png)

4. Use `` Ctrl+` `` (graven accent) to open a terminal and run the command `code ../myproject` to open a preconfigured azmeta workspace. A new browser tab will open in the `myproject` workspace.

   ![Screenshot of the command in a terminal.](./docs/images/switchworkspace.png)

5. Open a terminal again in the new workspace and login to the Azure CLI with the `az login` command.

# Connect to your Codespace 

Your Codespace and all of your code runs in Azure regardless of how you interface with the it.

*Note: Connecting to Jupyter Lab via a browser-based Codespaces session is [not yet supported](https://github.com/wpbrown/azmeta-codespace/issues/1).*

## In a Browser

Go to `https://online.visualstudio.com/environments` and click your Codespace to resume it and connect in the browser.

![Screenshot of the Codespaces web landing page.](./docs/images/suspendedwebui.png)

To quickly jump in to the `myproject` workspace in your Codespace, bookmark `https://online.visualstudio.com/environment/{CODESPACE_ID}?folder=%2Fhome%2Fcodespace%2Fworkspace%2Fmyproject` where `{CODESPACE_ID}` is the GUID of your Codespace.

* [Codespaces Browser Quickstart Docs](https://docs.microsoft.com/en-us/visualstudio/online/quickstarts/browser)

## In Visual Studio Code

Install the [Codespaces extension](https://marketplace.visualstudio.com/items?itemName=MS-vsonline.vsonline) in Visual Studio Code. Click your Codespace in the extension to connect in Visual Studio Code.

![Screenshot of the VS Code extension.](./docs/images/extension.png)

* [Codespaces Browser Quickstart Docs](https://docs.microsoft.com/en-us/visualstudio/online/quickstarts/vscode)
