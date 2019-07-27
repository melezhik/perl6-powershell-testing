# Sparrow6 Powershell Testing

Example of testing Powershell modules using Sparrow6

# Usage

## Write Powershell module:

`modules/hello/hello.ps1`

    function Hello {
    
      param(
        [Parameter(Mandatory=$true)]
        [String]$name
      )
    
      Write-Host Hello $name
    }

## Write Sparrow6 wrapper:

    mkdir -p .tom/tasks/hello

`.tom/tasks/hello/task.ps1`:

    Import-Module hello
    $name = config 'name'
    Hello -name $name

`.tom/tasks/hello/task.check`:

    generator: print "Hello ".( config()->{name} )

## Write Tomtit task

`tom --edit test-hello`

    task-run ".tom/tasks/test-hello", %( name => "Sparrow6" )

## Run test

`PSModulePath=$PWD/modules tom test-hello`

    02:47:26 07/27/2019 [repository] index updated from file:///home/melezhik/repo/api/v1/index
    02:47:26 07/27/2019 [.tom/tasks/test-hello] Hello Sparrow6
    [task check] stdout match <Hello Sparrow6> True


# Author

Alexey Melezhik

