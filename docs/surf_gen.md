# ApiGen

## SurfGen

[SurfGen](https://github.com/surfstudio/SurfGen) is our default choice.

SurfGen is used in projects that use the REST API and the Swagger specification to describe the API.


### Configuration

The files for API generation are placed in the [tools/api_generator/](tools/api_generator/) directory.

For the generation to be successful, the folder from the Swagger repository must be on the same level as the project folder in the file system. In the files [dto_codegen.sh](tools/api_generator/dto_codegen.sh) and [request_codegen.sh](tools/api_generator/request_codegen.sh) is necessary to replace the `flutter-template-swagger` with the name of the folder with the Swagger repository.

By default, the SurfGen version built for Apple Silicon-based machines is used for code generation.  
In order to run code generation on an Apple Intel or Linux-based machine, you need to [dto_codegen.sh](tools/api_generator/dto_codegen.sh) and [request_codegen.sh](tools/api_generator/request_codegen.sh) replace `apple_silicon_generator` with `apple_silicon_generator_intel` or `linux_generator` respectively.
If you need to create another binary file, use the [instructions](https://github.com/surfstudio/SurfGen#installation).


### Code Generation

To generate it, you need to run the script:
```sh  
sh scripts/surfgen.sh
```  
or using [Makefile](Makefile):  
```sh  
make surfgen
```  

As a result of the generation, DTO models and Api classes with methods for interacting with the API will be created.








