#include "../unity.h"
#include "../unity_fixture.h"

TEST_GROUP_RUNNER(Foo)
{
  RUN_TEST_CASE(Foo, VetorOrdenado);
  RUN_TEST_CASE(Foo, VetorInverso);
  RUN_TEST_CASE(Foo, VetorRepetido);
  RUN_TEST_CASE(Foo, VetorIguais);
  RUN_TEST_CASE(Foo, VetorNegativo);
  RUN_TEST_CASE(Foo, VetorNegativoPositivo);
  RUN_TEST_CASE(Foo, VetorLimiteMin);
  RUN_TEST_CASE(Foo, VetorLimMax);
}
