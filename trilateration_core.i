%module trilateration_core

%{
    #include "stdio.h"
    #include "math.h"
    #include "stdlib.h"
    #include "time.h"
%}

%{
    #define TRILATERATION (1)

    #define REGRESSION_NUM (10)
    #define SPEED_OF_LIGHT      (299702547.0)   // in m/s in air
    #define NUM_ANCHORS (5)
    #define REF_ANCHOR (5)	//anchor IDs are 1,2,3,4,5 etc. (don't start from 0!)

    #define		TRIL_3SPHERES							3
    #define		TRIL_4SPHERES							4

    typedef struct vec3d	vec3d;
    struct vec3d {
        double	x;
        double	y;
        double	z;
    };

    vec3d report;

    #define   MAXZERO  0.001

    #define		ERR_TRIL_CONCENTRIC						-1
    #define		ERR_TRIL_COLINEAR_2SOLUTIONS			-2
    #define		ERR_TRIL_SQRTNEGNUMB					-3
    #define		ERR_TRIL_NOINTERSECTION_SPHERE4			-4
    #define		ERR_TRIL_NEEDMORESPHERE					-5
%}

typedef struct vec3d	vec3d;
struct vec3d {
    double	x;
    double	y;
    double	z;
};

%immutable;
vec3d report;
%mutable;

%{
    vec3d vdiff(const vec3d vector1, const vec3d vector2);

    vec3d vsum(const vec3d vector1, const vec3d vector2);

    vec3d vmul(const vec3d vector, const double n);

    vec3d vdiv(const vec3d vector, const double n);

    double vdist(const vec3d v1, const vec3d v2);

    double vnorm(const vec3d vector);

    double dot(const vec3d vector1, const vec3d vector2);

    vec3d cross(const vec3d vector1, const vec3d vector2);

    double gdoprate(const vec3d tag, const vec3d p1, const vec3d p2, const vec3d p3);

    int sphereline(const vec3d p1, const vec3d p2, const vec3d sc, double r, double *const mu1, double *const mu2);

    int trilateration(vec3d *const result1,

                      vec3d *const result2,
                      vec3d *const best_solution,
                      const vec3d p1, const double r1,
                      const vec3d p2, const double r2,
                      const vec3d p3, const double r3,
                      const vec3d p4, const double r4,
                      const double maxzero);

    int deca_3dlocate (	vec3d	*const solution1,
                        vec3d	*const solution2,
                        vec3d	*const best_solution,
                        int		*const nosolution_count,
                        double	*const best_3derror,
                        double	*const best_gdoprate,
                        vec3d p1, double r1,
                        vec3d p2, double r2,
                        vec3d p3, double r3,
                        vec3d p4, double r4,
                        int *combination);

    int GetLocation(vec3d *best_solution, int use4thAnchor, vec3d* anchorArray, int *distanceArray);

    int getPos(int r1, int r2, int r3, int r4);


    int initialize(double x0, double y0, double z0, double x1, double y1, double z1, double x2, double y2, double z2, double x3, double y3, double z3);

%}

vec3d vdiff(const vec3d vector1, const vec3d vector2);

vec3d vsum(const vec3d vector1, const vec3d vector2);

vec3d vmul(const vec3d vector, const double n);

vec3d vdiv(const vec3d vector, const double n);

double vdist(const vec3d v1, const vec3d v2);

double vnorm(const vec3d vector);

double dot(const vec3d vector1, const vec3d vector2);

vec3d cross(const vec3d vector1, const vec3d vector2);

double gdoprate(const vec3d tag, const vec3d p1, const vec3d p2, const vec3d p3);

int sphereline(const vec3d p1, const vec3d p2, const vec3d sc, double r, double *const mu1, double *const mu2);

int trilateration(vec3d *const result1,

				  vec3d *const result2,
				  vec3d *const best_solution,
				  const vec3d p1, const double r1,
                  const vec3d p2, const double r2,
                  const vec3d p3, const double r3,
                  const vec3d p4, const double r4,
                  const double maxzero);

int deca_3dlocate (	vec3d	*const solution1,
					vec3d	*const solution2,
					vec3d	*const best_solution,
					int		*const nosolution_count,
					double	*const best_3derror,
					double	*const best_gdoprate,
					vec3d p1, double r1,
					vec3d p2, double r2,
					vec3d p3, double r3,
					vec3d p4, double r4,
					int *combination);

int GetLocation(vec3d *best_solution, int use4thAnchor, vec3d* anchorArray, int *distanceArray);

int getPos(int r1, int r2, int r3, int r4);


int initialize(double x0, double y0, double z0, double x1, double y1, double z1, double x2, double y2, double z2, double x3, double y3, double z3);
