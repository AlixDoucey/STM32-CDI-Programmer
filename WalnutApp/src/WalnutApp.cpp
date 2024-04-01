#include "Walnut/Application.h"
#include "Walnut/EntryPoint.h"

#include "Walnut/Image.h"
#include "Walnut/UI/UI.h"

#include "ImPlot/implot.h"
#include "ImPlot/MyPlot.h"

#include <nfd.h>

#include <cstdio>
#include <iostream>
#include <string>
#include <fstream>

class ExampleLayer : public Walnut::Layer
{
public:
	virtual void OnUIRender() override
	{
		ImGui::ShowDemoWindow();
		ImPlot::ShowDemoWindow();

		MyPlot::ShowAdvanceCurveWindow();
		MyPlot::ShowAdvanceDataWindow();

		UI_DrawAboutModal();
		UI_DrawToolsMetrics();
		UI_DrawExportDialog();
	}

	void UI_DrawAboutModal() {
		if (!m_AboutModalOpen)
			return;

		ImGui::OpenPopup("About");
		m_AboutModalOpen = ImGui::BeginPopupModal("About", nullptr, ImGuiWindowFlags_AlwaysAutoResize);
		if (m_AboutModalOpen)
		{
			auto image = Walnut::Application::Get().GetApplicationIcon();
			ImGui::Image(image->GetDescriptorSet(), { 48, 48 });

			ImGui::SameLine();
			Walnut::UI::ShiftCursorX(20.0f);

			ImGui::BeginGroup();
			ImGui::Text("Walnut application framework");
			ImGui::Text("by Studio Cherno,");
			ImGui::Text("forked by Chouxmimouli.");

			ImGui::EndGroup();

			if (Walnut::UI::ButtonCentered("Close"))
			{
				m_AboutModalOpen = false;
				ImGui::CloseCurrentPopup();
			}

			ImGui::EndPopup();
		}
	}
	
	void UI_DrawToolsMetrics() {
		if (show_implot_metrics) {
			ImPlot::ShowMetricsWindow(&show_implot_metrics);
		}
	}

	void UI_DrawExportDialog() {
		if (m_FileExportOpen) {

			NFD_Init();

			nfdchar_t *outPath;
			nfdfilteritem_t filterItem[2] = {"CubeIDE Project", "cproject"};
			nfdresult_t result = NFD_OpenDialog(&outPath, filterItem, 1, NULL);

			NFD_Quit();

			if (result == NFD_OKAY) {
				puts(outPath);
				NFD_FreePath(outPath);
				m_FileExportOpen = false;

				size_t len = strlen(outPath);

				if (len >= 9 && strcmp(&outPath[len - 9], ".cproject") == 0) {
					char* ExportDestination = new char[len - 9 + strlen("Core\\Inc\\IgnitionMap.h") + 1];
                    strncpy(ExportDestination, outPath, len - 9);
					strcpy(ExportDestination + len - 9, "Core\\Inc\\IgnitionMap.h");

					std::cout << "ExportDestination : " << ExportDestination << std::endl;
					MyPlot::Export();
					std::ofstream file(ExportDestination);

					file << "#define rev_limit " << MyPlot::RevLimitTag <<std::endl;

					file << "#define ignition_cut_time " << MyPlot::IgnitonCutTime*1000 << std::endl;

					file << "#define trigger_coil_angle " << MyPlot::MaxAdvanceTag << std::endl << std::endl;

					file << "uint8_t ignition_map[" << MyPlot::AmountPoints << "] = {" << std::endl;
					std::cout << MyPlot::AmountPoints << std::endl;
					for (int i = 1 ; i <= MyPlot::AmountPoints; i++) {
						if (i == MyPlot::AmountPoints) {
							file << MyPlot::CurvePoints[i] << std::endl;
						} else {
							file << MyPlot::CurvePoints[i] << std::endl;
							//"," <<
						}
					}
					file << "};" << std::endl;

					file.close();
					delete ExportDestination;
				} else {
					std::cout << "The selected file is not a '.cproject' file." << std::endl;
				}

			}
			else if (result == NFD_CANCEL) {
				puts("User pressed cancel.");
				m_FileExportOpen = false;
			}
			else {
				printf("Error: %s\n", NFD_GetError());
			}
		}

	}

	void ShowAboutModal() {
		m_AboutModalOpen = true;
	}
	void ShowToolsMetrics() {
		m_ToolsMetricsOpen = true;
	}
	void ShowExportDialog() {
		m_FileExportOpen = true;
	}

private:
	bool m_AboutModalOpen = false;
	bool m_ToolsMetricsOpen = false;
	bool m_FileExportOpen = false;
};

Walnut::Application* Walnut::CreateApplication(int argc, char** argv)
{
	Walnut::ApplicationSpecification spec;
	spec.Name = "Stm32 Cdi Programmer";
	spec.CustomTitlebar = true;

	Walnut::Application* app = new Walnut::Application(spec);
	std::shared_ptr<ExampleLayer> exampleLayer = std::make_shared<ExampleLayer>();
	app->PushLayer(exampleLayer);
	app->SetMenubarCallback([app, exampleLayer]()
	{
		if (ImGui::BeginMenu("File"))
		{
			if (ImGui::MenuItem("Open")) {}
			if (ImGui::MenuItem("Save", "Ctrl+S")) {}
			if (ImGui::MenuItem("Save As..")) {}
			if (ImGui::MenuItem("Export")) {
				exampleLayer->ShowExportDialog();
			}
			if (ImGui::MenuItem("Exit"))
			{
				app->Close();
			}
			ImGui::EndMenu();
		}

		if (ImGui::BeginMenu("Help"))
		{
			if (ImGui::BeginMenu("Tools"))
			{
				if (ImGui::MenuItem("Metrics", nullptr, &show_implot_metrics))
				{
					exampleLayer->ShowToolsMetrics();
				}
				ImGui::EndMenu();
			}
			if (ImGui::MenuItem("About"))
			{
				exampleLayer->ShowAboutModal();
			}
			ImGui::EndMenu();
		}
	});
	return app;
}