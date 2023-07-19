# Infrasetup
3-Tier Architecture setup in Azure Cloud by Terraform
## 3 Tier Architecture Explanation

I have used Terraform to create the 3-Tier architecture in Azure that includes three layers of application.

    1.	Presentation Layer
    2.	Application Layer 
    3.	Data Layer

### 1.	Presentation Layer
It is responsible for presenting the user interface and interacting with end-users. We are using Azure Load Balancers in our infra setup to distribute the load between application Virtual machines and Web Virtual Machines.

### 2.	Application Layer
The application layer contains the business logic and processes user requests received from the presentation layer. Here we are creating Azure Virtual Machines to host our application.

### 3.	Data Layer
It manages the storage and retrieval of data used by the application. It can include databases, file storage, or any other data storage mechanism. In this architecture design we are creating Azure SQL Server and Database in this layer.

### 4.	Brief introduction of modules and functionality created in the Repository.

    1.	Repository Name: InfraSetup
    2.	Terraform Folder Name : Terraform
        It the starting point of the terraform where below files are created.

        a.	Main.tf 
            Modules are being called for the specific resource that is being creating by this code for 3-Tier Infra creation.
            It creates resources in the below order. I am passing variables in the modules that are being defined in variables.tf file and values of the variables will be provided in dev.tfvars file.  
            i.	  ResourceGroup
            ii.	  Network: VNet and Subnets are created within this modules.
            iii.  Availability Set: Creating AV Set to place the VM inside Availability Set if required or as per the requirement.
            iv.	  LinuxVM: Creating the Linux VMs for both Application and web with the single file. Multiple virtual machine can be created with this module as I have used for_each loop.  In the same way Windows VM can also be created if required. (Haven’t included the code for the same)
            v.    NSG: Created module for Network Security group which is then attached to the subnets for filtering the traffic based on Inbound Rules.
            vi.   LoadBalancer: Used to distribute the traffic within VMst.
            vii.  Azuredatabase: In this module I am creating Azure SQL Server and Database for Data Layer.
            viii. Connectwebnapptier: In this module, I have written the code to connect wenb and application tier, where I am defining the backend of loadbalancer as the Azure Vitual machine where it is sharing the load.
            ix.	Connectappndbtier: In this module, I am connecting the Database with the Virtual Machine. For this initially I am installing the SQL Client within the Virtual machine with the help of Custom Script Extension and then Configure database connection string in the application tier.

        b.	Provider.tf
            In this azurerm providers should be defined. Also the backend of the remote state files. I have used azure blob storage for remote state files.

        c.	Variables.tf
            In this file all the variables should be defined that are being passed into the modules.

        d.	Dev.tfvars
            In this file we are providing the values of all the variables that are being passed within the module.

        e.	Modules
            This is the folder where we are defining all the modules which leads to the resource creation.
### 5.	Modules
All the modules contains below files:
Main.tf: Resource creating script is written here.
Data.tf: Data blocks that are being used inside the code.
Output.tf: Value of any specific item of the resource
Variables.tf: Variables are being defined in this.

#### 1.	ResourceGroup
    Creating resource group in this module by main.tf.
####  2.	Network
    VNet and Subnets are created within this modules.

#### 3.	Availability Set
    Creating AV Set to place the VM inside Availability Set if required or as per the requirement.
#### 4.	LinuxVM
    Creating the Linux VMs for both Application and web with the single file. Multiple virtual machine can be created with this module as I have used for_each loop.  In the same way Windows VM can also be created if required. (Haven’t included the code for the same)
#### 5.	NSG
    Created module for Network Security group which is then attached to the subnets for filtering the traffic based on Inbound Rules.

#### 6.	LoadBalancer
    Used to distribute the traffic within VMs.

#### 7.	Azuredatabase
    In this module I am creating Azure SQL Server and Database for Data Layer.

#### 8.	Connectwebnapptier
    In this module, I have written the code to connect web and application tier, where I am defining the backend of load balancer as the Azure Virtual machine where it is sharing the load.

#### 9.	Connectappndbtier
    In this module, I am connecting the Database with the Virtual Machine. For this initially I am installing the SQL Client within the Virtual machine with the help of Custom Script Extension and then Configure database connection string in the application tier.

### 6.	Special services of terraform that are being used:

    1.	For_Each Loop: Used to create multiple VM with the single variables file.
    2.	Locals: Used in the module Availability set to set the values and then passed into the resource.
    3.	Modular Structure for the resusability of the code.


