using System;
using System.Diagnostics;
using System.Linq;
using System.Windows.Forms;
using Mommosoft.ExpertSystem;

namespace JakaGra
{
    public partial class MainForm : Form
    {
        Localization l = new Localization();
        private Mommosoft.ExpertSystem.Environment clips = new Mommosoft.ExpertSystem.Environment();
        public MainForm()
        {
            ConsoleTraceListener tl = new ConsoleTraceListener();
            InitializeComponent();
            clips.AddRouter(new DebugRouter());
            clips.Load("bazaaut.clp");
            clips.Reset();
            clips.Run(1);
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            NextUIState();
        }

        private void OnClickButton(object sender, EventArgs e)
        {
            if ((string)nextButton.Tag == "Next")
            {
                if (choicesPanel.Controls.Count != 0)
                {
                    if (isNumeric)
                    {
                        var nud = choicesPanel.Controls.OfType<NumericUpDown>().First();
                        var xd = clips.AssertString("(" + relationAsserted + " " + nud.Value + ")");
                        Console.WriteLine("(" + relationAsserted + " " + nud.Value + ") ");
                    }
                    else if (isCheckbox)
                    {
                        var checkedButtons = choicesPanel.Controls.OfType<CheckBox>()
                            .Where(r => r.Checked);
                        foreach (var box in checkedButtons)
                        {
                            var xd = clips.AssertString("(" + relationAsserted + " " + box.Tag + ")");
                            Console.WriteLine("(" + relationAsserted + " " + box.Tag + ") ");
                        }
                    }
                    else if (isYesNo)
                    {
                        var checkedButton = choicesPanel.Controls.OfType<RadioButton>()
                            .First(r => r.Checked);
                        if ((string) checkedButton.Tag == "yes")
                        {
                            var xd = clips.AssertString("(" + relationAsserted + ")");
                            Console.WriteLine("(" + relationAsserted + ")");
                        }
                    }
                    else
                    {
                        var checkedButton = choicesPanel.Controls.OfType<RadioButton>()
                            .First(r => r.Checked);
                        var xd = clips.AssertString("(" + relationAsserted + " " + checkedButton.Tag + ")");
                        Console.WriteLine("(" + relationAsserted + " " + checkedButton.Tag + ") ");
                    }
                }
                else
                {
                    clips.AssertString("(start)");
                }
                clips.Run(1);
                NextUIState();
            }
            else if ((string)nextButton.Tag == "Restart")
            {
                clips.Reset();
                clips.Run(1);
                NextUIState();
            }
        }
        
        private string lastRelationAsserted = "";
        private string relationAsserted;
        bool isNumeric = false;
        private bool isCheckbox = false;
        private bool isYesNo = false;

        private void NextUIState()
        {
            choicesPanel.Controls.Clear();

            String evalStr = "(find-all-facts ((?f UI-state)) TRUE)";
            using (var result = (MultifieldValue)clips.Eval(evalStr))
            {
                var fv = (FactAddressValue)result[0];
                relationAsserted = fv.GetFactSlot("relation-asserted").ToString();

                if (relationAsserted == lastRelationAsserted)
                {
                    clips.Run(1);
                    NextUIState();
                    return;
                }

                lastRelationAsserted = relationAsserted;

                isNumeric = false;
                isYesNo = false;
                isCheckbox = false;
                switch (fv.GetFactSlot("state").ToString())
                {
                    case "numeric":
                        nextButton.Text = l["Next"];
                        nextButton.Tag = "Next";
                        isNumeric = true;
                        break;
                    case "checkbox":
                        nextButton.Text = l["Next"];
                        nextButton.Tag = "Next";
                        isCheckbox = true;
                        break;
                    case "yesno":
                        nextButton.Text = l["Next"];
                        nextButton.Tag = "Next";
                        isYesNo = true;
                        break;
                    case "final":
                        nextButton.Text = l["Restart"];
                        nextButton.Tag = "Restart";
                        Console.WriteLine("***ZACZYNAMY OD NOWA***");
                        break;
                    case "initial":
                        nextButton.Text = l["Next"];
                        nextButton.Tag = "Next";
                        break;
                    default:
                        nextButton.Text = l["Next"];
                        nextButton.Tag = "Next";
                        break;
                }

                choicesPanel.Controls.Clear();

                if (isNumeric)
                {
                    var nud = new NumericUpDown();
                    nud.Increment = 1;
                    nud.DecimalPlaces = 0;
                    nud.Maximum = 500;
                    choicesPanel.Controls.Add(nud);
                }
                else if (isCheckbox)
                {
                    var va = (MultifieldValue)fv.GetFactSlot("valid-answers");

                    foreach (var item in va)
                    {
                        var rb = new CheckBox();
                        rb.Text = l[item.ToString()];
                        rb.Tag = item.ToString();
                        rb.AutoSize = true;
                        choicesPanel.Controls.Add(rb);
                    }
                }
                else if (isYesNo)
                {
                    var rbYes = new RadioButton();
                    rbYes.Text = l["yes"];
                    rbYes.Tag = "yes";
                    rbYes.Checked = fv.GetFactSlot("response").ToString() == "yes";

                    var rbNo = new RadioButton();
                    rbNo.Text = l["no"];
                    rbNo.Tag = "no";
                    rbNo.Checked = !rbYes.Checked;

                    choicesPanel.Controls.Add(rbYes);
                    choicesPanel.Controls.Add(rbNo);
                }
                else
                {
                    var va = (MultifieldValue)fv.GetFactSlot("valid-answers");

                    var selected = fv.GetFactSlot("response").ToString();

                    foreach (var item in va)
                    {
                        var rb = new RadioButton();
                        rb.Text = l[item.ToString()];
                        rb.Checked = item.ToString() == selected;
                        rb.Tag = item.ToString();
                        rb.AutoSize = true;

                        choicesPanel.Controls.Add(rb);
                    }
                }
                messageLabel.Text = l[fv.GetFactSlot("display").ToString()];

            }
        }

        private void messageLabel_Click(object sender, EventArgs e)
        {

        }
    }
}
