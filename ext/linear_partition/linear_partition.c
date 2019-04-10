#include <ruby.h>
#include <float.h>

#define MAX(a, b) (a > b ? a : b)

VALUE cArray;

static VALUE
partition(VALUE self, VALUE _k)
{
  long n = RARRAY_LEN(self);
  int k = NUM2INT(_k);
  double m[n][k];
  int d[n - 1][k - 1];
  double cost;

  for (int i = 0; i < k; i++) m[0][i] = NUM2DBL(rb_ary_entry(self, 0));
  for (int i = 1; i < n; i++) {
    m[i][0] = NUM2DBL(rb_ary_entry(self, i)) + m[i - 1][0];
  }

  for (int i = 1; i < n; i++)
    for (int j = 1; j < k; j++) {
      m[i][j] = DBL_MAX;
      for (int x = 0; x < i; x++) {
        cost = MAX(m[x][j-1], m[i][0] - m[x][0]);
        if (m[i][j] > cost) {
          m[i][j] = cost;
          d[i - 1][j - 1] = x;
        }
      }
    }

  n = n - 1;
  k = k - 2;

  VALUE result = rb_ary_new();
  VALUE inner;
  while (k >= 0) {
    inner = rb_ary_new();
    for (int i = d[n - 1][k] + 1; i < n + 1; i++) {
      rb_ary_push(inner, rb_ary_entry(self, i));
    }
    rb_ary_unshift(result, inner);
    n = d[n - 1][k];
    k--;
  }

  inner = rb_ary_new();
  for (int i = 0; i < n + 1; i++) {
      rb_ary_push(inner, rb_ary_entry(self, i));
  }
  rb_ary_unshift(result, inner);
  return result;
  }

void
Init_linear_partition() {
  cArray = rb_define_class("Array", rb_cObject);
  rb_define_method(cArray, "linpar", partition, 1);
}
