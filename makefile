php-cs-fixer:
	./vendor/bin/php-cs-fixer fix --config=.php-cs-fixer.dist.php -v

phpstan:
	./vendor/bin/phpstan analyse -c phpstan.neon

phpstan-baseline:
	./vendor/bin/phpstan analyse phpstan.neon --generate-baseline

test:
	./vendor/bin/phpunit

openapi-generator:
	docker pull openapitools/openapi-generator-cli:latest
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli:latest generate \
		--additional-properties invokerPackage="Colapiombo\Behaviour\OpenAPI\Generated" \
		--global-property models,supportingFiles,modelTests=false,skipFormModel=true \
		--generator-name php \
		--input-spec /local/petstore.yaml \
		--output /local/gen
