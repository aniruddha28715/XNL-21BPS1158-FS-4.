import { useEffect, useRef } from "react";

export default function VideoChat() {
  const localVideo = useRef(null);
  const remoteVideo = useRef(null);
  const peerConnection = useRef(null);

  useEffect(() => {
    const startVideoChat = async () => {
      const stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
      localVideo.current.srcObject = stream;

      peerConnection.current = new RTCPeerConnection();
      stream.getTracks().forEach((track) => peerConnection.current.addTrack(track, stream));

      peerConnection.current.ontrack = (event) => {
        remoteVideo.current.srcObject = event.streams[0];
      };
    };

    startVideoChat();
  }, []);

  return (
    <div>
      <video ref={localVideo} autoPlay playsInline />
      <video ref={remoteVideo} autoPlay playsInline />
    </div>
  );
}
