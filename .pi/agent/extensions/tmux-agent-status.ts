import { execFileSync } from "node:child_process";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const script = `${process.env.HOME}/.local/bin/tmux-agent-status`;

export default function (pi: ExtensionAPI) {
  if (!process.env.TMUX || !process.env.TMUX_PANE) return;
  const report = (state: string) => {
    try { execFileSync(script, [state, "pi"], { stdio: "ignore", timeout: 1000 }); } catch { /* tmux may have exited */ }
  };

  pi.on("session_start", (_event, ctx) => {
    if (ctx.mode === "tui") report("idle");
  });
  pi.on("agent_start", (_event, ctx) => {
    if (ctx.mode === "tui") report("working");
  });
  pi.on("agent_settled", (_event, ctx) => {
    if (ctx.mode === "tui") report("done");
  });
  pi.on("session_shutdown", (_event, ctx) => {
    if (ctx.mode === "tui") report("clear");
  });
}
