using UnityEngine;

public class CameraController : MonoBehaviour
{
    public float movementSpeed = 5f;
    public float rotationSpeed = 3f;

    void Update()
    {
        // Camera Movement
        float horizontalMovement = Input.GetAxis("Horizontal");
        float verticalMovement = Input.GetAxis("Vertical");

        Vector3 movement = new Vector3(horizontalMovement, 0f, verticalMovement) * movementSpeed * Time.deltaTime;
        transform.Translate(movement);

        // Camera Rotation
        float rotation = 0f;

        // Left arrow key rotates the camera left
        if (Input.GetKey(KeyCode.LeftArrow))
        {
            rotation -= rotationSpeed;
        }

        // Right arrow key rotates the camera right
        if (Input.GetKey(KeyCode.RightArrow))
        {
            rotation += rotationSpeed;
        }

        transform.Rotate(Vector3.up, rotation);
    }
}
