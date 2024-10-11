#include "../src/sort.h"
#include "unity.h"
#include "unity_fixture.h"

TEST_GROUP(Foo);

TEST_SETUP(Foo)
{
}

TEST_TEAR_DOWN(Foo)
{
}

TEST(Foo, VetorOrdenado)
{
  // All of these should pass
  int a[] = {0,1,2,3,4,5,6,7,8,9};
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",COUNTING));
}

TEST(Foo, VetorInverso)
{
  int a[] = {9,8,7,6,5,4,3,2,1,0};
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",COUNTING));
}

TEST(Foo, VetorRepetido)
{
  int a[] = {9,8,7,6,5,5,4,3,2,1};
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",COUNTING));
}

TEST(Foo, VetorIguais)
{
  int a[] = {5,5,5,5,5,5,5,5,5,5};
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",COUNTING));
}

TEST(Foo, VetorNegativo)
{
  int a[] = {-1,-2,-3,-4,-5,-6,-7,-8,-9,-10};
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",COUNTING));
}

TEST(Foo, VetorNegativoPositivo)
{
  int a[] = {-1,2,-3,4,-5,6,-7,8,-9,10};
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,10,"On",COUNTING));
}

TEST(Foo, VetorLimiteMin)
{
  int a[] = {1,2};
  TEST_ASSERT_EQUAL(0, sort(a,2,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,2,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,2,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,2,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,2,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,2,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,2,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,2,"On",COUNTING));
}

TEST(Foo, VetorLimiteMax)
{
  int a[] = {20,18,17,16,15,14,13,12,11,10,9,8,7,6,5,3,2,1,0};
  TEST_ASSERT_EQUAL(0, sort(a,20,"Onlogn",QUICK));
  TEST_ASSERT_EQUAL(0, sort(a,20,"Onlogn",MERGE));
  TEST_ASSERT_EQUAL(0, sort(a,20,"Onlogn",HEAP));
  TEST_ASSERT_EQUAL(0, sort(a,20,"On2",SELECTION));
  TEST_ASSERT_EQUAL(0, sort(a,20,"On2",INSERTION));
  TEST_ASSERT_EQUAL(0, sort(a,20,"On2",BUBBLE));
  TEST_ASSERT_EQUAL(0, sort(a,20,"On",RADIX));
  TEST_ASSERT_EQUAL(0, sort(a,20,"On",COUNTING));
}