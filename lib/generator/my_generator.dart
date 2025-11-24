import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(
    pubName: 'sparkhire_api',
    pubAuthor: 'Ice Man',
  ),
  inputSpecFile: 'http://localhost:8000/api/v3/api-docs',
  generatorName: Generator.dio,
  outputDirectory: 'api/sparkhire',
)
class MyGenerator {}
