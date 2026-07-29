import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.manifold.admissible

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.admissible_closed

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse