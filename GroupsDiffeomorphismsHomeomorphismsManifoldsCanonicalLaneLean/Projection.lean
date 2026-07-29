import GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def diffeomorphismProjection : Projection DiffeomorphismEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem diffeomorphism_projection_idempotent (x : DiffeomorphismEndgameState) :
    diffeomorphismProjection.toFun (diffeomorphismProjection.toFun x) = diffeomorphismProjection.toFun x := by
  exact diffeomorphismProjection.idempotent x

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse